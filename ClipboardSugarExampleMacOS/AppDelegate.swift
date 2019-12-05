import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   /**
    * Creates the view
    */
   lazy var view: NSView = {
      let contentRect = window.contentRect(forFrameRect: window.frame)/*size of win sans titlebar*/
      let view: View = .init(frame: contentRect)
      window.contentView = view
      view.layer?.backgroundColor = NSColor.orange.cgColor
      return view
   }()
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      _ = view
   }
}

open class View: NSView {
   override open var isFlipped: Bool { return true }/*TopLeft orientation*/
   override public init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("hello world")
      self.wantsLayer = true/*if true then view is layer backed*/
      test()
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension View {
   /**
    *
    */
   func test() {
      let hasString = ClipboardAsserter.hasString()
      Swift.print("hasString:  \(hasString)")
      let str = ClipboardParser.getString()
      Swift.print("str:  \(String(describing: str))")
      ClipboardModifier.setString(string: "Something")
   }
}
