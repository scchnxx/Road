struct TestData {
    
    static var vdList = """
    {
        "UpdateTime": "2019-11-01T05:41:53+08:00",
        "UpdateInterval": 21600,
        "SrcUpdateTime": "2019-11-01T00:00:00+08:00",
        "SrcUpdateInterval": 86400,
        "AuthorityCode": "NFB",
        "VDs": [
            {
                "VDID": "VD-N1-N-198-O-SE-21-北上出口-彰化",
                "SubAuthorityCode": "NFB-CR",
                "BiDirectional": 0,
                "DetectionLinks": [
                {
                    "LinkID": "0000101145010N",
                    "Bearing": "N",
                    "RoadDirection": "N",
                    "LaneNum": 1,
                    "ActualLaneNum": 1
                }
                ],
                "VDType": 1,
                "LocationType": 5,
                "DetectionType": 2,
                "PositionLon": 120.5235272,
                "PositionLat": 24.06366325,
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadSection": {
                "Start": "埔鹽系統交流道",
                "End": "彰化交流道"
                },
                "LocationMile": "198K+000"
            },
            {
                "VDID": "VD-N2-W-11.344-N-LOOP",
                "SubAuthorityCode": "NFB-NR",
                "BiDirectional": 0,
                "DetectionLinks": [
                {
                    "LinkID": "0000200101100H",
                    "Bearing": "N",
                    "RoadDirection": "N",
                    "LaneNum": 3,
                    "ActualLaneNum": 3
                }
                ],
                "VDType": 1,
                "LocationType": 5,
                "DetectionType": 1,
                "PositionLon": 121.28354,
                "PositionLat": 25.001116,
                "RoadID": "000020",
                "RoadName": "國道2號",
                "RoadClass": 0,
                "RoadSection": {
                "Start": "南桃園交流道",
                "End": "機場系統交流道"
                },
                "LocationMile": "11K+344"
            },
            {
                "VDID": "VD-N5-S-14.000-O-NE-1",
                "SubAuthorityCode": "NFB-PL",
                "BiDirectional": 0,
                "DetectionLinks": [
                {
                    "LinkID": "0000501003000F",
                    "Bearing": "SE",
                    "RoadDirection": "SE",
                    "LaneNum": 1,
                    "ActualLaneNum": 1
                }
                ],
                "VDType": 1,
                "LocationType": 5,
                "DetectionType": 2,
                "PositionLon": 121.7122271,
                "PositionLat": 24.9414772,
                "RoadID": "000050",
                "RoadName": "國道5號",
                "RoadClass": 0,
                "RoadSection": {
                "Start": "石碇交流道",
                "End": "坪林行控交流道"
                },
                "LocationMile": "14K+000"
            },
            {
                "VDID": "VD-N1-N-33-I-EN-1-五股",
                "SubAuthorityCode": "NFB-NR",
                "BiDirectional": 0,
                "DetectionLinks": [
                {
                    "LinkID": "0000101115080F",
                    "Bearing": "E",
                    "RoadDirection": "E",
                    "LaneNum": 1,
                    "ActualLaneNum": 1
                }
                ],
                "VDType": 1,
                "LocationType": 5,
                "DetectionType": 2,
                "PositionLon": 121.4445,
                "PositionLat": 25.070078,
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadSection": {
                "Start": "五股交流道",
                "End": "五股轉接道交流道"
                },
                "LocationMile": "33K+000"
            },
            {
                "VDID": "VD-N3-S-129.653-M-LOOP",
                "SubAuthorityCode": "NFB-CR",
                "BiDirectional": 0,
                "DetectionLinks": [
                {
                    "LinkID": "0000300012960K",
                    "Bearing": "SW",
                    "RoadDirection": "SW",
                    "LaneNum": 3,
                    "ActualLaneNum": 3
                }
                ],
                "VDType": 1,
                "LocationType": 5,
                "DetectionType": 1,
                "PositionLon": 120.78915,
                "PositionLat": 24.601648,
                "RoadID": "000030",
                "RoadName": "國道3號",
                "RoadClass": 0,
                "RoadSection": {
                "Start": "大山交流道",
                "End": "後龍交流道"
                },
                "LocationMile": "129K+653"
            }
        ]
    }
    """
    
    static var cctcList = """
    {
        "UpdateTime": "2019-10-31T17:14:07+08:00",
        "UpdateInterval": 21600,
        "SrcUpdateTime": "2019-10-31T00:00:00+08:00",
        "SrcUpdateInterval": 86400,
        "AuthorityCode": "NFB",
        "CCTVs": [
            {
                "CCTVID": "CCTV-N3-S-307.6-M",
                "SubAuthorityCode": "NFB-SR",
                "LinkID": "0000100030600D",
                "VideoStreamURL": "https://cctvs.freeway.gov.tw/live-view/mjpg/video.cgi?camera=222",
                "LocationType": 1,
                "PositionLon": 120.230542,
                "PositionLat": 23.15635,
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadDirection": "S",
                "RoadSection": {
                    "Start": "水上系統交流道",
                    "End": "白河交流道"
                },
                "LocationMile": "307K+600"
            },
            {
                "CCTVID": "CCTV-N6-W-20.138-M",
                "SubAuthorityCode": "NFB-CR",
                "LinkID": "0000600102000M",
                "VideoStreamURL": "https://cctvc.freeway.gov.tw/abs2mjpg/bmjpg?camera=105",
                "LocationType": 1,
                "PositionLon": 120.84457,
                "PositionLat": 23.999123,
                "RoadID": "000060",
                "RoadName": "國道6號",
                "RoadClass": 0,
                "RoadDirection": "NW",
                "RoadSection": {
                    "Start": "北山交流道",
                    "End": "國姓交流道"
                },
                "LocationMile": "20K+138"
            },
            {
                "CCTVID": "CCTV-N1H-N-54.323-M",
                "SubAuthorityCode": "NFB-NR",
                "LinkID": "00001B0105400H",
                "VideoStreamURL": "https://cctvn01.freeway.gov.tw/vStream.php?pm=159,A47,22",
                "LocationType": 1,
                "PositionLon": 121.258354,
                "PositionLat": 25.0067,
                "RoadID": "00001B",
                "RoadName": "國道1號五股楊梅高架道路",
                "RoadClass": 0,
                "RoadDirection": "NE",
                "RoadSection": {
                    "Start": "中壢轉接一交流道",
                    "End": "機場系統交流道"
                },
                "LocationMile": "54K+323"
            }
        ]
    }
    """
    
    static var sectionLinkList = """
    {
        "UpdateTime": "2019-10-31T17:14:40+08:00",
        "UpdateInterval": 21600,
        "SrcUpdateTime": "2019-10-31T00:00:00+08:00",
        "SrcUpdateInterval": 86400,
        "AuthorityCode": "NFB",
        "SectionLinks": [
            {
                "SectionID": "0001",
                "StartLinkID": "0000100000000C",
                "EndLinkID": "0000100000110C"
            },
            {
                "SectionID": "0003",
                "StartLinkID": "0000100000080C",
                "EndLinkID": "0000100000260C"
            }
        ]
    }
    """
    
    static var sectionList = """
    {
        "UpdateTime": "2019-10-31T17:14:29+08:00",
        "UpdateInterval": 21600,
        "SrcUpdateTime": "2019-10-31T00:00:00+08:00",
        "SrcUpdateInterval": 86400,
        "AuthorityCode": "NFB",
        "Sections": [
            {
                "SectionID": "0001",
                "SectionName": "國道1號(基隆端到基隆交流道)",
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadDirection": "S",
                "RoadSection": {
                    "Start": "基隆端",
                    "End": "基隆交流道"
                },
                "SectionLength": 1.1,
                "SectionMile": {
                    "StartKM": "0K+000",
                    "EndKM": "1K+100"
                }
            },
            {
                "SectionID": "0003",
                "SectionName": "國道1號(基隆交流道到八堵交流道)",
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadDirection": "S",
                "RoadSection": {
                    "Start": "基隆交流道",
                    "End": "八堵交流道"
                },
                "SectionLength": 1.5,
                "SectionMile": {
                    "StartKM": "1K+100",
                    "EndKM": "2K+600"
                }
            },
            {
                "SectionID": "0005",
                "SectionName": "國道1號(八堵交流道到大華系統交流道)",
                "RoadID": "000010",
                "RoadName": "國道1號",
                "RoadClass": 0,
                "RoadDirection": "S",
                "RoadSection": {
                    "Start": "八堵交流道",
                    "End": "大華系統交流道"
                },
                "SectionLength": 2.4,
                "SectionMile": {
                    "StartKM": "2K+600",
                    "EndKM": "5K+000"
                }
            }
        ]
    }
    """
    
}
