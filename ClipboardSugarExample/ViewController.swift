import UIKit
import ClipboardSugar_iOS

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      let hasString = ClipboardAsserter.hasString()
      Swift.print("hasString:  \(hasString)")
      let str = ClipboardParser.getString()
      Swift.print("str:  \(str)")
      ClipboardModifier.setString(string: "Something")
   }
}
