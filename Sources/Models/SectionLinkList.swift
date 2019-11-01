import Foundation

public struct SectionLinkList: Codable {
    
    public struct SectionLink: Codable {
        
        public struct LinkIDItem: Codable {
            public var linkID: String
            
            enum CodingKeys: String, CodingKey {
                case linkID = "LinkID"
            }
        }
        
        public var sectionID: String
        public var subAuthorityCode: String?
        public var startLinkID: String
        public var endLinkID: String
        public var linkIDs: [LinkIDItem]?

        enum CodingKeys: String, CodingKey {
            case sectionID        = "SectionID"
            case subAuthorityCode = "SubAuthorityCode"
            case startLinkID      = "StartLinkID"
            case endLinkID        = "EndLinkID"
            case linkIDs          = "LinkIDs"
        }
    }
    
    public var authorityCode: String
    public var sectionLinks: [SectionLink]
    
    enum CodingKeys: String, CodingKey {
        case authorityCode = "AuthorityCode"
        case sectionLinks  = "SectionLinks"
    }
    
}

extension SectionLinkList: RoadURLProvider {
    
    static var url: URL {
        let str = "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/SectionLink/Freeway?$format=JSON"
        return URL(string: str)!
    }
    
}
