
@testable import unicode_math
@testable import unicode_math_class
import XCTest

final class Tests: XCTestCase {
    func testUnicodeMathClass() {
        XCTAssertEqual(math_class("0"), MathClass.Normal)
        XCTAssertEqual(math_class("a"), MathClass.Alphabetic)
        XCTAssertEqual(math_class("𝔸"), MathClass.Alphabetic)
        XCTAssertEqual(math_class("+"), MathClass.Vary)
        XCTAssertEqual(math_class("×"), MathClass.Binary)
        XCTAssertEqual(math_class("("), MathClass.Opening)
        XCTAssertEqual(math_class(","), MathClass.Punctuation)
        XCTAssertEqual(math_class("|"), MathClass.Fence)
        XCTAssertEqual(math_class("😃"), nil)
    }

    func testMathClassInit() {
        XCTAssertEqual(MathClass("Normal"), .Normal)
        XCTAssertNil(MathClass("FooBar"))
    }

    func testUnicodeMathSymbol() {
        let symbol = MATH_SYMBOLS[0]

        XCTAssertEqual(symbol.codepoint, "!")
        XCTAssertEqual(symbol.command, "mathexclam") // not "\\mathexclam"
        XCTAssertEqual(symbol.description, "exclamation mark")

        // LaTeX unicode-math marks it as `\mathclose`
        // Unicode MathClass marks it as `Normal`
        XCTAssertEqual(math_class(symbol.codepoint), MathClass.Normal)
    }
}
