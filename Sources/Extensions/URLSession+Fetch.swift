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

extension URLRequest {
    
	fileprivate static func roadRequest(url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> URLRequest? {
        guard let auth = Road.auth else { return nil }
        
        var req  = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        
        req.setValue(auth.xdate, forHTTPHeaderField: "x-date")
        req.setValue(auth.authorization, forHTTPHeaderField: "Authorization")
        req.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        
        return req
    }
    
}

public struct RoadFetchOptions {
    
	public var select: String?
    public var top: Int?
    public var order: String?
	
	public init(select: String? = nil, top: Int? = nil, order: String? = nil) {
		self.select = select
		self.top 	= top
		self.order 	= order
	}
	
}

extension URLSession {
    
    public func dataTask<T: Codable>(with type: T.Type, options: RoadFetchOptions? = nil,
                                     _ completionHandler: @escaping (Result<T, FetchError>) -> Void) -> URLSessionDataTask?
	{
        guard let urlProvider = T.self as? RoadURLProvider.Type else {
            return nil
        }
        
		let url = urlProvider.url(select: options?.select, top: options?.top, orderBy: options?.order)
		
		guard let req = URLRequest.roadRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 3) else {
			return nil
		}
		
		return dataTask(with: req) { data, res, err in
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
