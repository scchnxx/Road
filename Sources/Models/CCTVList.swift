import Foundation

public struct CCTVList: Codable {
    
    public struct CCTV: Codable {
        
        public struct LookingView: Codable {
            
            public var bearing: String
            public var image: String
            
            enum CodingKeys: String, CodingKey {
                case bearing = "Bearing"
                case image   = "Image"
            }
            
        }
        
        public struct RoadSection: Codable {
            
            public var start: String
            public var end: String
            
            enum CodingKeys: String, CodingKey {
                case start = "Start"
                case end   = "End"
            }
            
        }
        
        public var cctvID: String
        public var subAuthorityCode: String
        public var linkID: String
        public var lookingViews: [LookingView]?
        public var videoStreamURL: String
        public var videoImageURL: String?
        public var imageRefreshRate: Float?
        public var locationType: Int
        public var positionLon: Float
        public var positionLat: Float
        public var surveillanceType: Int?
        public var surveillanceDescription: String?
        public var roadID: String
        public var roadName: String
        public var roadClass: Int?
        public var roadDirection: String?
        public var roadSection: RoadSection
        public var locationMile: String
        public var layoutMapURL: String?
        
        enum CodingKeys: String, CodingKey {
            case cctvID                  = "CCTVID"
            case subAuthorityCode        = "SubAuthorityCode"
            case linkID                  = "LinkID"
            case lookingViews            = "LookingViews"
            case videoStreamURL          = "VideoStreamURL"
            case videoImageURL           = "VideoImageURL"
            case imageRefreshRate        = "ImageRefreshRate"
            case locationType            = "LocationType"
            case positionLon             = "PositionLon"
            case positionLat             = "PositionLat"
            case surveillanceType        = "SurveillanceType"
            case surveillanceDescription = "SurveillanceDescription"
            case roadID                  = "RoadID"
            case roadName                = "RoadName"
            case roadClass               = "RoadClass"
            case roadDirection           = "RoadDirection"
            case roadSection             = "RoadSection"
            case locationMile            = "LocationMile"
            case layoutMapURL            = "LayoutMapURL"
        }
        
    }
    
    public var authorityCode: String?
    public var cctvs: [CCTV]
    
    enum CodingKeys: String, CodingKey {
        case authorityCode = "AuthorityCode"
        case cctvs         = "CCTVs"
    }
    
}

extension CCTVList: RoadURLProvider {
    
    static var url: URL {
        let str = "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/CCTV/Freeway?$format=JSON"
        return URL(string: str)!
    }
    
}
