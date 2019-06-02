#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

public class ClipboardAsserter {
   #if os(macOS)
   /**
    * - Parameter clipboardFormat: ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
    */
   public static func hasData(_ clipboardFormat: String) -> Bool { // Untested
      let pasteboard = NSPasteboard.general
      return pasteboard.canReadItem(withDataConformingToTypes: [clipboardFormat])
   }
   #endif
   public static func hasString() -> Bool { // Untested
      #if os(iOS)
      return UIPasteboard.general.hasStrings
      #elseif os(macOS)
      return hasData(NSPasteboard.PasteboardType.string.rawValue)
      #endif
   }
}
