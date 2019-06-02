# ClipboardSugar
Sugar for clipboard

### Install
- Manual: open `.xcodeproj`
- Carthage: `github "eonist/ClipboardSugar" "master"`
- CocoaPod (coming soon)

## Example:
```swift
let hasString = ClipboardAsserter.hasString()
Swift.print("hasString:  \(hasString)")
let str = ClipboardParser.getString()
Swift.print("str:  \(str)")
ClipboardModifier.setString(string: "Something")
```
