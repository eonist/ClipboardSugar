import UIKit

class ViewController: UIViewController {
   /**
    * - Fixme: ⚠️️ Move to unittest
    */
   override func viewDidLoad() {
      super.viewDidLoad()
      let hasString = ClipboardAsserter.hasString()
      Swift.print("hasString:  \(hasString)")
      let str = ClipboardParser.getString()
      Swift.print("str:  \(String(describing: str))")
      ClipboardModifier.setString(string: "Something")
   }
}
