# swift-unicode-math

[![Platform Compatibility](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20-brightgreen)](https://swift.org/platforms/)
[![Swift Version](https://img.shields.io/badge/Swift-5.9+-orange)](https://swift.org)


Swift equivalent of [typst/unicode-math-class] plus [latex3/unicode-math table].

* [typst/unicode-math-class]: Determine the Unicode class of a mathematical character.
* [latex3/unicode-math table]: Define Unicode math symbols, associated LaTeX commands, etc.

## Add Dependency

```swift
let package = Package(
    // ...
    dependencies: [
        .package(url: "https://github.com/satzlich/swift-unicode-math", branch: "main"),
    ],

    // ...
    // .target(
    dependencies: [
        .product(name: "unicode_math", package: "swift-unicode-math"),
        .product(name: "unicode_math_class", package: "swift-unicode-math"),
    ],
)
```


## Example

```swift
XCTAssertEqual(math_class("0"), MathClass.Normal)
XCTAssertEqual(math_class("a"), MathClass.Alphabetic)
XCTAssertEqual(math_class("𝔸"), MathClass.Alphabetic)
XCTAssertEqual(math_class("+"), MathClass.Vary)
XCTAssertEqual(math_class("×"), MathClass.Binary)
XCTAssertEqual(math_class("("), MathClass.Opening)
XCTAssertEqual(math_class(","), MathClass.Punctuation)
XCTAssertEqual(math_class("|"), MathClass.Fence)
XCTAssertEqual(math_class("😃"), nil)
```

```swift
let symbol = MATH_SYMBOLS[0]

XCTAssertEqual(symbol.codepoint, "!")
XCTAssertEqual(symbol.command, "mathexclam") // not "\\mathexclam"
XCTAssertEqual(symbol.description, "exclamation mark")

// LaTeX unicode-math marks it as `\mathclose`
// Unicode MathClass marks it as `Normal`
XCTAssertEqual(math_class(symbol.codepoint), MathClass.Normal)
```

## Reference

* [Unicode Tech Report #25]
* [MathClass data file]

## License
This package is dual-licensed under the MIT and Apache 2.0 licenses.

[typst/unicode-math-class]: https://github.com/typst/unicode-math-class
[latex3/unicode-math table]: https://github.com/latex3/unicode-math/blob/master/unicode-math-table.tex
[Unicode Tech Report #25]: https://www.unicode.org/reports/tr25/
[MathClass data file]: https://www.unicode.org/Public/math/revision-15/MathClass-15.txt
[Test code]: https://github.com/satzlich/swift-unicode-math/blob/main/Tests/UnicodeMathTests/Tests.swift
