//: Playground - noun: a place where people can play
// resizes view when keyboard appears
import UIKit

class UIViewController: UIViewController {
    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { [weak self] (note) in
            let endFrame = note.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
            self?.bottomLayoutConstraint.constant = endFrame.height
        }
    }
}
