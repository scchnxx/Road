import Foundation

fileprivate let SOI = Data([0xFF, 0xD8])
fileprivate let EOI = Data([0xFF, 0xD9])

extension PreviewViewModel {
    
    enum State: Int {
        case loading
        case playing
        case stopped
    }
    
}

class PreviewViewModel: NSObject {
    
    private let timeoutInterval = TimeInterval(3)
    private var session: URLSession!
    private var currentDataTask: URLSessionDataTask?
    private var imageData = Data()
    private var cctvURL: URL?
    private var recoveryCount = 0
    
    var state = State.stopped
    var didOutputImageData: ((Data) -> Void)?
    var didStartLoading:    (() -> Void)?
    var didStart:           (() -> Void)?
    var didFailToStart:     (() -> Void)?
    var didStop:            (() -> Void)?
    
    override init() {
        super.init()
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    }
    
    private func isValidImageData(_ data: Data) -> Bool {
        guard data.count >= 125 else { return false }
        let endIndex = data.endIndex
        let hasSOI = data.subdata(in: 0..<2) == SOI
        let hasEOI = (data.range(of: EOI, options: .backwards, in: (endIndex - 4)..<endIndex) != nil)
        return hasSOI && hasEOI
    }
    
    private func recover() {
        guard let url = cctvURL else { return }
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        if state != .loading && state != .playing {
            state = .loading
            didStartLoading?()
        }
        currentDataTask = session.dataTask(with: request)
        currentDataTask?.resume()
    }
    
    func resume() {
        guard state != .playing else { return }
        recover()
    }
    
    func play(cctv: CCTVList.CCTV) {
        let url = URL(string: cctv.videoStreamURL)!
        
        guard url != cctvURL else {
            resume()
            return
        }
        
        cctvURL = url
        stop()
        recover()
    }
    
    func stop() {
        guard let task = currentDataTask else { return }
        currentDataTask = nil
        task.cancel()
        recoveryCount = 0
        imageData.removeAll()
        state = .stopped
        didStop?()
    }
    
}

extension PreviewViewModel: URLSessionDelegate, URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        imageData += data
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void)
    {
        if isValidImageData(imageData) {
            if state != .playing {
                state = .playing
                didStart?()
            } else if recoveryCount != 0 {
                recoveryCount = 0
            }
            didOutputImageData?(imageData)
        }
        imageData.removeAll()
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard task == currentDataTask else { return }
        
        if recoveryCount != 3 {
            recoveryCount += 1
            recover()
        } else {
            recoveryCount = 0
            imageData.removeAll()
            currentDataTask = nil
            let oldState = state
            state = .stopped
            (oldState == .playing) ? didStop?() : didFailToStart?()
        }
    }
    
}
