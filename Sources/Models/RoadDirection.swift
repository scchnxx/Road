public struct RoadDirection: Equatable, OptionSet, Codable, CustomStringConvertible {
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let n = RoadDirection(rawValue: 1 << 0)
    public static let s = RoadDirection(rawValue: 1 << 1)
    public static let e = RoadDirection(rawValue: 1 << 2)
    public static let w = RoadDirection(rawValue: 1 << 3)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self).lowercased()
        
        rawValue = 0
        
        if string.contains("n") { update(with: .n) }
        if string.contains("s") { update(with: .s) }
        if string.contains("e") { update(with: .e) }
        if string.contains("w") { update(with: .w) }
    }
    
    public var description: String {
        var desc = ""
        if contains(.e) { desc += "東" }
        if contains(.w) { desc += "西" }
        if contains(.n) { desc += "北" }
        if contains(.s) { desc += "南" }
        return desc
    }
    
}
