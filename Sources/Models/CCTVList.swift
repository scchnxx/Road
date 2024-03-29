import Foundation

public struct CCTVList: Equatable, Codable {
    
    public struct CCTV: Equatable, Codable {
        
        public struct LookingView: Equatable, Codable {
            
            public var bearing: RoadSection
            public var image: String
            
            enum CodingKeys: String, CodingKey {
                case bearing = "Bearing"
                case image   = "Image"
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
        public var roadDirection: RoadDirection?
        public var roadSection: RoadSection
        public var locationMile: String
        public var layoutMapURL: String?
        public var alternativeRoadDirection: RoadDirection {
            let strs = cctvID.split(separator: "-")
            if strs.count == 5 {
                return RoadDirection(string: String(strs[2]))
            } else {
                return RoadDirection(rawValue: 0)
            }
        }
        
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
    
    public static var url: URL {
        let str = "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/CCTV/Freeway?$format=JSON"
        return URL(string: str)!
    }
    
}
