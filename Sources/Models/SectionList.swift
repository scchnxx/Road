import Foundation

public struct SectionList: Codable {
    
    public struct Section: Codable {
        
        public struct SectionMile: Codable {
            
            public var startKM: Float
            public var endKM: Float
            
            enum CodingKeys: String, CodingKey {
                case startKM = "StartKM"
                case endKM   = "EndKM"
            }
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let start = try container.decode(String.self, forKey: .startKM)
                let end = try container.decode(String.self, forKey: .endKM)
                
                if let start = start.sectionMiles {
                    startKM = start
                } else {
                    throw DecodingError.dataCorruptedError(forKey: CodingKeys.startKM, in: container,
                                                           debugDescription: "StartKM doesn't match {a}K+{b}")
                }
                if let end = end.sectionMiles {
                    endKM = end
                } else {
                    throw DecodingError.dataCorruptedError(forKey: CodingKeys.endKM, in: container,
                                                           debugDescription: "EndKM doesn't match {a}K+{b}")
                }
            }
            
        }
        
        public struct Point: Codable {
            
            public var positionLat: Float
            public var positionLon: Float
            
            enum CodingKeys: String, CodingKey {
                case positionLat = "PositionLat"
                case positionLon = "PositionLon"
            }
            
        }
        
        public var sectionID: String
        public var subAuthorityCode: String?
        public var sectionName: String
        public var roadID: String
        public var roadName: String
        public var roadClass: Int
        public var roadDirection: RoadDirection
        public var roadSection: RoadSection
        public var sectionLength: Float
        public var sectionMile: SectionMile
        public var sectionStart: Point?
        public var sectionEnd: Point?
        
        enum CodingKeys: String, CodingKey {
            case sectionID        = "SectionID"
            case subAuthorityCode = "SubAuthorityCode"
            case sectionName      = "SectionName"
            case roadID           = "RoadID"
            case roadName         = "RoadName"
            case roadClass        = "RoadClass"
            case roadDirection    = "RoadDirection"
            case roadSection      = "RoadSection"
            case sectionLength    = "SectionLength"
            case sectionMile      = "SectionMile"
            case sectionStart     = "SectionStart"
            case sectionEnd       = "SectionEnd"
        }
        
    }
    
    public var authorityCode: String
    public var sections: [Section]
    
    enum CodingKeys: String, CodingKey {
        case authorityCode = "AuthorityCode"
        case sections      = "Sections"
    }
    
}

extension SectionList: RoadURLProvider {
    
    static var url: URL {
        let str = "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/Section/Freeway?$format=JSON"
        return URL(string: str)!
    }
    
}
