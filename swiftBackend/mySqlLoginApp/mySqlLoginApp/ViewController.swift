//

//


import UIKit

class ViewController: UIViewController {
    
    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "http://localhost:8888/mySqlLoginServer/v1/register.php"
    
    //View variables
    
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    //Button action
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        //creating parameters for the post request
        let username = textFieldUsername.text!,
            password = textFieldPassword.text!,
            name = textFieldName.text!,
            email = textFieldEmail.text!,
            phone = textFieldPhone.text!
        
        let request = NSMutableURLRequest(url: NSURL(string: URL_USER_REGISTER)! as URL)
        request.httpMethod = "POST"
        
        let postString = "username=\(username)&password=\(password)&name=\(name)&email=\(email)&phone=\(phone)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            print("Response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("ResponseString = \(String(describing: responseString))")
        }
        
        self.labelMessage.text = "User Added to Database"        
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

