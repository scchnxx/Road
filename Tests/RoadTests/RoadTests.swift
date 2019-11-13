import XCTest
@testable import Road

final class RoadTests: XCTestCase {
    
    func testVDList() {
        let json = TestData.vdList.data(using: .utf8)!
        let result = (try? JSONDecoder().decode(VDList.self, from: json))
        XCTAssertNotNil(result)
    }
    
    func testCCTVList() {
        let json = TestData.cctcList.data(using: .utf8)!
        let result = (try? JSONDecoder().decode(CCTVList.self, from: json))
        XCTAssertNotNil(result)
    }
    
    func testSectionList() {
        let json = TestData.sectionList.data(using: .utf8)!
        let result = (try? JSONDecoder().decode(SectionList.self, from: json))
        XCTAssertNotNil(result)
    }
    
    func testSectionLinkList() {
        let json = TestData.sectionLinkList.data(using: .utf8)!
        let result = (try? JSONDecoder().decode(SectionLinkList.self, from: json))
        XCTAssertNotNil(result)
    }
    
    func testVDLiveList() {
        let json = TestData.vdLiveList.data(using: .utf8)!
        let result = (try? JSONDecoder().decode(VDLiveList.self, from: json))
        printErr(VDLiveList.self, from: json)
        XCTAssertNotNil(result)
    }
    
    func printErr<T: Codable>(_ type: T.Type, from data: Data) {
        do {
            _ = try JSONDecoder().decode(T.self, from: data)
            print("[OK]")
        } catch {
            print("[\(error)]")
        }
    }
    
//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
