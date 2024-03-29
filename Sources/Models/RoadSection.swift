public struct RoadSection: Equatable, Codable {
    
    public var start: String
    public var end: String
    
    enum CodingKeys: String, CodingKey {
        case start = "Start"
        case end   = "End"
    }
    
}
