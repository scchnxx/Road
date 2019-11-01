import XCTest
@testable import Road

final class RoadTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Road().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
