import Foundation

protocol RoadURLProvider {
    static var url: URL { get }
    static func url(select: String?, top: Int?, orderBy: String?) -> URL
}

extension RoadURLProvider {
    
    static func url(select: String?, top: Int?, orderBy: String?) -> URL {
        var str = url.absoluteString
        if let select = select {
            str += "&$select=\(select)"
        }
        if let top = top {
            str += "&$top=\(top)"
        }
        if let order = orderBy {
            str += "&$orderby=\(order)"
        }
        return URL(string: str)!
    }
    
}
