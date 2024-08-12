#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif
/**
 * Universal clipboard lib for macOS and iOS
 * - Description: Provides functionality to assert the presence of specific types of data in the system clipboard for both macOS and iOS platforms.
 */
public final class ClipboardAsserter { // fix: move to own lib again when compute / memory allows for it
   #if os(macOS)
   /**
    * Asserts if the clipboard has data of a specific type
    * - Description: Checks if the clipboard contains data of the specified format.
    * - Parameter clipboardFormat: ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
    */
   public static func hasData(_ clipboardFormat: String) -> Bool { // Untested
      let pasteboard = NSPasteboard.general // Get the general pasteboard
      return pasteboard.canReadItem(withDataConformingToTypes: [clipboardFormat]) // Check if the pasteboard can read an item with data conforming to the specified clipboard format
   }
   #endif
   /**
    * Asserts if the clipboard has data of string type
    * - Description: Checks if the clipboard contains any string data.
    */
   public static func hasString() -> Bool { // Untested
      #if os(iOS)
      return UIPasteboard.general.hasStrings // Check if the general pasteboard has strings
      #elseif os(macOS)
      return hasData(NSPasteboard.PasteboardType.string.rawValue) // Check if the pasteboard has data of type string
      #endif
   }
}
