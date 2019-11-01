import Foundation

public struct SectionList: Codable {
    
    public struct Section: Codable {
        
        public struct RoadSection: Codable {
            
            public var start: String
            public var end: String
            
            enum CodingKeys: String, CodingKey {
                case start = "Start"
                case end   = "End"
            }
            
        }
        
        public struct SectionMile: Codable {
            
            public var startKM: String
            public var endKM: String
            
            enum CodingKeys: String, CodingKey {
                case startKM = "StartKM"
                case endKM   = "EndKM"
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
        public var roadDirection: String
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
