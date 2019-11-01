public enum RoadDirection: String, CustomStringConvertible, CaseIterable, Codable {
    case none = ""
    case n  = "N"
    case e  = "E"
    case s  = "S"
    case w  = "W"
    case ne = "NE"
    case se = "SE"
    case sw = "SW"
    case nw = "NW"
    
    public var description: String {
        switch self {
        case .none: return "無"
        case .n:    return "北"
        case .e:    return "東"
        case .s:    return "南"
        case .w:    return "西"
        case .ne:   return "東北"
        case .se:   return "東南"
        case .sw:   return "西南"
        case .nw:   return "西北"
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let rawValue = try? container.decode(String.self), let dir = RoadDirection(rawValue: rawValue) {
            self = dir
        } else {
            self = .none
        }
    }
    
}
