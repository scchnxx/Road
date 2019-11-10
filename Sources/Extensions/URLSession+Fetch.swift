import Foundation

public struct Road {
    
    static var auth: Auth?

    public static func setAuth(id: String, key: String) {
        auth = Auth.gen(appID: id, appKey: key)
    }
    
}

public enum FetchError: Error {
    case networkError
    case decoderError(Error)
}

public struct RoadFetchOptions {
    
    public var select: String?
    public var top: Int?
    public var order: String?
    
    public init(select: String? = nil, top: Int? = nil, order: String? = nil) {
        self.select = select
        self.top     = top
        self.order     = order
    }
    
}

extension URLRequest {
    
    public init?(roadURLProvider: RoadURLProvider.Type,
                options: RoadFetchOptions? = nil,
                cachePolicy: CachePolicy = .useProtocolCachePolicy,
                timeoutInterval: TimeInterval)
    {
        guard let auth = Road.auth else { return nil }
        
        let url = roadURLProvider.url(select: options?.select, top: options?.top, orderBy: options?.order)
        
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        
        setValue(auth.xdate, forHTTPHeaderField: "x-date")
        setValue(auth.authorization, forHTTPHeaderField: "Authorization")
        setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
    }
    
}

extension URLSession {
    
    public func dataTask<T: Codable>(_ type: T.Type,
                                     request: URLRequest,
                                     _ completionHandler: @escaping (Result<T, FetchError>) -> Void) -> URLSessionDataTask
    {
        return dataTask(with: request) { data, res, err in
            guard let data = data, err == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(.decoderError(error)))
            }
        }
    }
    
}
