// Copyright 2024-2025 Lie Yan

import XCTest

@testable import UnicodeMathClass

final class MathClassTests: XCTestCase {
  func testUnicodeMathClass() {
    XCTAssertEqual(mathClass("0"), MathClass.Normal)
    XCTAssertEqual(mathClass("a"), MathClass.Alphabetic)
    XCTAssertEqual(mathClass("𝔸"), MathClass.Alphabetic)
    XCTAssertEqual(mathClass("+"), MathClass.Vary)
    XCTAssertEqual(mathClass("×"), MathClass.Binary)
    XCTAssertEqual(mathClass("("), MathClass.Opening)
    XCTAssertEqual(mathClass(","), MathClass.Punctuation)
    XCTAssertEqual(mathClass("|"), MathClass.Fence)
    XCTAssertEqual(mathClass("😃"), nil)
  }
}
