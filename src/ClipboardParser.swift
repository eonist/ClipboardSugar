#if os(iOS)
import UIKit
typealias Pasteboard = UIPasteboard
#elseif os(macOS)
import Cocoa
typealias Pasteboard = NSPasteboard
#endif
/**
 * Fixme: ⚠️️ clean up this class, there are types for ios etc. google it
 */
public class ClipboardParser {
   /**
    * - Remark: remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
    */
   public static func getString() -> String? {
      #if os(iOS)
      return Pasteboard.general.string
      #elseif os(macOS)
      return stringData(Pasteboard.PasteboardType.string.rawValue)
      #endif
   }
   #if os(macOS)
   /**
    * - Note: remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
    * - Paramter textFormat: ClipboardFormats.TEXT_FORMAT etc
    * - Remark: NSStringPboardType etc
    */
   public static func stringData(_ dataType: String) -> String? {
      let pasteboard = Pasteboard.general
      let data: String? = pasteboard.string(forType: Pasteboard.PasteboardType(rawValue: dataType))
      return data
   }
   #endif
}
