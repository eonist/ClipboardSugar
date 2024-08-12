# ClipboardSugar
> Sugar for clipboard

### Description:
This library provides easy-to-use Swift utilities for interacting with the clipboard on macOS.

### Prerequisites
- macOS 10.15+
- Swift 5.3+

### Install
- Manual: open `.xcodeproj`
- SPM: `.package(url: "https://github.com/eonist/ClipboardSugar.git", .branch("master"))`

## Example:
```swift
let hasString = ClipboardAsserter.hasString()
Swift.print("hasString:  \(hasString)")
let str = ClipboardParser.getString()
Swift.print("str:  \(str)")
ClipboardModifier.setString(string: "Something")
```

## Todo: 
- Add github tests
- Look for more modern OSS code
- Ask copilot for improvments
