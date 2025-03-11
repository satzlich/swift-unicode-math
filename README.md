# swift-unicode-math

[![Platform Compatibility](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20-brightgreen)](https://swift.org/platforms/)
[![Swift Version](https://img.shields.io/badge/Swift-6+-orange)](https://swift.org)


Swift equivalent of [typst/unicode-math-class].

* [typst/unicode-math-class]: Determine the Unicode class of a mathematical character.

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
        .product(name: "UnicodeMathClass", package: "swift-unicode-math"),
    ],
)
```


## Example

```swift
XCTAssertEqual(mathClass("0"), MathClass.Normal)
XCTAssertEqual(mathClass("a"), MathClass.Alphabetic)
XCTAssertEqual(mathClass("𝔸"), MathClass.Alphabetic)
XCTAssertEqual(mathClass("+"), MathClass.Vary)
XCTAssertEqual(mathClass("×"), MathClass.Binary)
XCTAssertEqual(mathClass("("), MathClass.Opening)
XCTAssertEqual(mathClass(","), MathClass.Punctuation)
XCTAssertEqual(mathClass("|"), MathClass.Fence)
XCTAssertEqual(mathClass("😃"), nil)
```

## Reference

* [Unicode Tech Report #25]
* [MathClass data file]

## License
This package is dual-licensed under the MIT and Apache 2.0 licenses.

[typst/unicode-math-class]: https://github.com/typst/unicode-math-class
[Unicode Tech Report #25]: https://www.unicode.org/reports/tr25/
[MathClass data file]: https://www.unicode.org/Public/math/revision-15/MathClass-15.txt
[Test code]: https://github.com/satzlich/swift-unicode-math/blob/main/Tests/UnicodeMathTests/Tests.swift
