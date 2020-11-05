import XCTest
@testable import swift_static_content

final class swift_static_contentTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_static_content().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
