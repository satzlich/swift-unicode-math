
/// The revision of the used data file.
public let REVISION = 15

/// Classification of a mathematical character.
public enum MathClass: Comparable, CaseIterable, CustomStringConvertible {
    case Normal
    case Alphabetic
    case Binary
    case Closing
    case Diacritic
    case Fence
    case GlyphPart
    case Large
    case Opening
    case Punctuation
    case Relation
    case Space
    case Unary
    case Vary
    case Special

    @inlinable
    public init?(_ s: String) {
        switch s {
        case "Normal": self = .Normal
        case "Alphabetic": self = .Alphabetic
        case "Binary": self = .Binary
        case "Closing": self = .Closing
        case "Diacritic": self = .Diacritic
        case "Fence": self = .Fence
        case "GlyphPart": self = .GlyphPart
        case "Large": self = .Large
        case "Opening": self = .Opening
        case "Punctuation": self = .Punctuation
        case "Relation": self = .Relation
        case "Space": self = .Space
        case "Unary": self = .Unary
        case "Vary": self = .Vary
        case "Special": self = .Special
        default: return nil
        }
    }

    @inlinable
    public var description: String {
        switch self {
        case .Normal: "Normal"
        case .Alphabetic: "Alphabetic"
        case .Binary: "Binary"
        case .Closing: "Closing"
        case .Diacritic: "Diacritic"
        case .Fence: "Fence"
        case .GlyphPart: "GlyphPart"
        case .Large: "Large"
        case .Opening: "Opening"
        case .Punctuation: "Punctuation"
        case .Relation: "Relation"
        case .Space: "Space"
        case .Unary: "Unary"
        case .Vary: "Vary"
        case .Special: "Special"
        }
    }
}

/// Determine the class of a mathematical character.
///
/// Returns `nil` if the character isn't part of any class.
@inlinable
public func math_class(_ codepoint: UnicodeScalar) -> MathClass? {
    MATH_CLASSES[codepoint]
}
