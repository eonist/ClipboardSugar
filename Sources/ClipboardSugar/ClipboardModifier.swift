#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif
/**
 * Universal clipboard lib for macOS and iOS
 * - Description: Provides methods to modify the system clipboard's contents, allowing the setting of various data formats for both macOS and iOS platforms.
 * - Remark: On Mac OS, when you set the format parameter to ClipboardFormats.URL_FORMAT, the URL is transferred only if it is a valid URL. Otherwise, the Clipboard object is emptied (and calling getData() returns null).
 * - Remark: Clipboard.generalClipboard.setDataHandler can set a method and when the data is pasted this method is called and then it returns some data that ultimaltly ends up as the pasted data
 * ClipboardFormats.TEXT_FORMAT String   string data
 * ClipboardFormats.HTML_FORMAT String   HTML string data
 * ClipboardFormats.URL_FORMAT String   URL string (AIR only)
 * ClipboardFormats.RICH_TEXT_FORMAT   ByteArray   Rich Text Format data
 * ClipboardFormats.BITMAP_FORMAT   BitmapData   bitmap data (AIR only)
 * ClipboardFormats.FILE_LIST_FORMAT   array of File   an array of files (AIR only)
 * Custom format name   any   object reference and serialized clone
 */
public final class ClipboardModifier {
   #if os(macOS)
   /**
    * Set string data
    * - Description: Sets the specified string data to the clipboard in the given format.
    * - Parameters:
    *   - string: String to copy to clipboard
    *   - clipboardFormat: Format of the string
    */
   public static func setStringData(_ string: String, _ clipboardFormat: String) {
      let pb = Pasteboard.general // Get the general pasteboard
      pb.clearContents() // Clear any previous data, since a system clipboard can have 2 versions of the same data, etc.
      pb.setString(string, forType: Pasteboard.PasteboardType(rawValue: clipboardFormat)) // Set the string on the pasteboard for the specified clipboard format
   }
   #endif
   /**
    * Set string
    * - Description: Copies the provided string to the system clipboard.
    * - Parameter string: String to copy to clipboard
    */
   public static func setString(string: String) {
      #if os(iOS)
      Pasteboard.general.string = string // Set the string on the general pasteboard on iOS
      #elseif os(macOS)
      /*return*/ setStringData(string, Pasteboard.PasteboardType.string.rawValue) // Set the string data on the pasteboard for the specified clipboard format on macOS
      #endif
   }
}
