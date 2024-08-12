#if os(iOS)
import UIKit
typealias Pasteboard = UIPasteboard
#elseif os(macOS)
import Cocoa
typealias Pasteboard = NSPasteboard
#endif
/**
 * Universal clipboard lib for macOS and iOS
 * - Description: Provides methods to parse and retrieve various data formats from the system clipboard for both macOS and iOS platforms.
 * - Fixme: ⚠️️ Clean up this class, there are types for iOS etc. google it
 * - Fixme: ⚠️️ Add support for data and other file-formats etc
 */
public final class ClipboardParser {
   /**
    * Returns string data if there is any in the clipboard
    * - Description: Retrieves a string from the system clipboard if available.
    * - Remark: Remember to assert if the clipboard has the requested format first by using `ClipboardAsserter.hasData` etc
    */
   public static func getString() -> String? {
      #if os(iOS)
      return Pasteboard.general.string // Get the string from the general pasteboard on iOS
      #elseif os(macOS)
      return stringData(Pasteboard.PasteboardType.string.rawValue) // Get the string data from the pasteboard for the specified clipboard format on macOS
      #endif
   }
   #if os(macOS)
   /**
    * Retrieves string data from the clipboard based on the specified data type.
    * - Remark: Remember to assert if the clipboard has the requested format first by using `ClipboardAsserter.hasData` etc
    * - Remark: NSStringPboardType etc
    * - Paramter dataType: `ClipboardFormats.TEXT_FORMAT` etc
    */
   public static func stringData(_ dataType: String) -> String? {
      let pasteboard: NSPasteboard = Pasteboard.general // Get the general pasteboard
      let data: String? = pasteboard.string(forType: Pasteboard.PasteboardType(rawValue: dataType)) // Get the string data from the pasteboard for the specified clipboard format
      return data // Return the string data
   }
   #endif
}
