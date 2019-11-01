import Foundation

public struct VDList: Codable {
	
	public struct VD: Codable {
		
		public struct DetectionLink: Codable {
			
			public var linkID: String
			public var bearing: String
			public var roadDirection: RoadDirection
			public var laneNum: Int
			public var actualLaneNum: Int
			
			enum CodingKeys: String, CodingKey {
				case linkID        = "LinkID"
				case bearing       = "Bearing"
				case roadDirection = "RoadDirection"
				case laneNum 	   = "LaneNum"
				case actualLaneNum = "ActualLaneNum"
			}
			
		}
        
        public var vdID: String
        public var subAuthorityCode: String
        public var biDirectional: Int
        public var detectionLinks: [DetectionLink]
        public var vdType: Int
        public var locationType: Int
        public var detectionType: Int
        public var positionLon: Float
        public var positionLat: Float
        public var roadID: String
        public var roadName: String
        public var roadClass: Int
        public var roadSection: RoadSection
        public var locationMile: String
        public var layoutMapURL: String?
        
        enum CodingKeys: String, CodingKey {
            case vdID             = "VDID"
            case subAuthorityCode = "SubAuthorityCode"
            case biDirectional    = "BiDirectional"
            case detectionLinks   = "DetectionLinks"
            case vdType           = "VDType"
            case locationType     = "LocationType"
            case detectionType    = "DetectionType"
            case positionLon      = "PositionLon"
            case positionLat      = "PositionLat"
            case roadID           = "RoadID"
            case roadName         = "RoadName"
            case roadClass        = "RoadClass"
            case roadSection      = "RoadSection"
            case locationMile     = "LocationMile"
            case layoutMapURL     = "LayoutMapURL"
        }
        
	}
    
    public var authorityCode: String
    public var vds: [VD]
    
    enum CodingKeys: String, CodingKey {
        case authorityCode = "AuthorityCode"
        case vds           = "VDs"
    }
	
}

extension VDList: RoadURLProvider {
    
    static var url: URL {
        let str = "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/VD/Freeway?$format=JSON"
        return URL(string: str)!
    }
    
}
