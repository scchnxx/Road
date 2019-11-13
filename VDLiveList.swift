import Foundation

//VDLiveList {
//    UpdateTime (DateTime, optional): 本平台資料更新時間(ISO8601格式:yyyy-MM-ddTHH:mm:sszzz)  ,
//    UpdateInterval (integer): 本平台資料更新週期(秒)  ,
//    SrcUpdateTime (DateTime, optional): 來源端平台資料更新時間(ISO8601格式:yyyy-MM-ddTHH:mm:sszzz)  ,
//    SrcUpdateInterval (integer): 來源端平台資料更新週期(秒)  ,
//    AuthorityCode (string, optional): 業管機關簡碼 ,
//    VDLives (Array[VDLive], optional): 資料(陣列) ,
//    Count (integer, optional): 資料總筆數
//}
//VDLive {
//    VDID (string, optional): VD設備代碼 ,
//    SubAuthorityCode (string, optional): 業管子機關簡碼  ,
//    LinkFlows (Array[LinkFlow], optional): 路段車流偵測資訊 ,
//    Status (integer, optional): 設備狀態 = ['0: 正常', '1: 通訊異常', '2: 停用或施工中', '3: 設備故障'] ,
//    DataCollectTime (DateTime, optional): 資料蒐集時間(ISO8601格式:yyyy-MM-ddTHH:mm:sszzz)
//}
//LinkFlow {
//    LinkID (string, optional): 基礎路段代碼, 請參閱[基礎路段代碼表] ,
//    Lanes (Array[Lane], optional): 偵側路段車道資訊
//}
//Lane {
//    LaneID (integer, optional): 車道代碼 ,
//    LaneType (integer, optional): 車道種類
//    Speed (number, optional): 平均速率偵測值, -99=資料異常 ,
//    Occupancy (number, optional): 佔有率偵測值 ,
//    Vehicles (Array[Vehicle], optional): 車道內車輛資訊
//}
//Vehicle {
//    VehicleType (string, optional): 車種代碼, 請參閱[車種代碼] ,
//    Volume (integer, optional): 流量偵測值, -99=資料異常 ,
//    Speed (number, optional): 平均速率偵測值, -99=資料異常
//}

public struct VDLiveList: Codable {
    
    public struct VDLive: Codable {
        public var vdID: String
        public var subAuthorityCode: String
        public var linkFlows: [LinkFlow]
        /// 設備狀態 = ['0: 正常', '1: 通訊異常', '2: 停用或施工中', '3: 設備故障'] ,
        public var status: Int
        public var dataCollectTime: String
        
        enum CodingKeys: String, CodingKey {
            case vdID             = "VDID"
            case subAuthorityCode = "SubAuthorityCode"
            case linkFlows        = "LinkFlows"
            case status           = "Status"
            case dataCollectTime  = "DataCollectTime"
        }
        
    }
    

    public struct LinkFlow: Codable {
        
        public struct Lane: Codable {
            
            public struct Vehicle: Codable {
                public var vehicleType: String
                /// -99 = 資料異常
                public var volume: Int
                /// -99 = 資料異常
                public var speed: Float
                
                enum CodingKeys: String, CodingKey {
                    case vehicleType = "VehicleType"
                    case volume      = "Volume"
                    case speed       = "Speed"
                }
                
            }
            
            public var laneID: Int
            /// 車道種類 = ['1: 一般車道', '2: 快車道', '3: 慢車道', '4: 機車道', '5: 高承載車道', '6: 公車專用道',
            ///  '7: 轉向車道', '8: 路肩', '9: 輔助車道', '10: 調撥車道', '11: 其他'] ,
            public var laneType: Int
            /// -99 = 資料異常
            public var speed: Float
            public var occupancy: Float
            public var vehicles: [Vehicle]
            
            enum CodingKeys: String, CodingKey {
                case laneID    = "LaneID"
                case laneType  = "LaneType"
                case speed     = "Speed"
                case occupancy = "Occupancy"
                case vehicles  = "Vehicles"
            }
            
        }
        
        public var linkID: String
        public var lanes: [Lane]
        
        enum CodingKeys: String, CodingKey {
            case linkID = "LinkID"
            case lanes  = "Lanes"
        }
    }
    
    public var authorityCode: String
    public var vdLives: [VDLive]
    
    enum CodingKeys: String, CodingKey {
        case authorityCode = "AuthorityCode"
        case vdLives       = "VDLives"
    }
    
}

extension VDLiveList: RoadURLProvider {
    public static var url: URL {
        URL(string: "https://traffic.transportdata.tw/MOTC/v2/Road/Traffic/Live/VD/Freeway?$format=JSON")!
    }
    
    
}
