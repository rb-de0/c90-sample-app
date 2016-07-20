import XCTest
@testable import App

class AppTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(App().text, "Hello, World!")
    }


    static var allTests : [(String, (AppTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
