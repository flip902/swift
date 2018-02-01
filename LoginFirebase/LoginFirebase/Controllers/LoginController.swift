//
//  LoginController.swift
//  LoginFirebase
//
//  Created by Phillip Carlino on 2017-12-16.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7351993545, green: 0.897208472, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        button.titleLabel?.font =  UIFont(name: "Didot-Bold", size: 18)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7351993545, green: 0.897208472, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text
        else {
                print("Form is not valid")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            // Successfully logged in
            print("Login Successful!")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleRegister() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let name = nameTextField.text else {
                print("Form is not valid")
                return
            }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user: User?, error) in
            if error != nil {
                print(error!)
                return
            }
            // Successfully Authrnticated User
            guard let uid = user?.uid else { return }
            let ref = Database.database().reference(fromURL: "https://haligrovelogin.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err!)
                    return
                }
                
                print("Saved user sucsessfully into firebase database.")
                self.dismiss(animated: true, completion: nil)
            })
        })
    }
    
    let nameTextField: UITextField = {
        let font = UIFont(name: "Didot-Italic", size: 20)!
        let name = "Name"
        let tf = UITextField()
        var placeholder = NSMutableAttributedString()
        tf.font = UIFont(name: "Didot-Bold", size: 18)
        tf.textColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        placeholder = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font:font])
        placeholder.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1), range:NSRange(location:0,length:name.count))
        tf.attributedPlaceholder = placeholder
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Didot-Bold", size: 18)
        tf.textColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        let font = UIFont(name: "Didot-Italic", size: 20)!
        let name = "Email"
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font:font])
        placeholder.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1), range:NSRange(location:0,length:name.count))
        tf.attributedPlaceholder = placeholder
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        let font = UIFont(name: "Didot-Italic", size: 20)!
        let name = "Password"
        var placeholder = NSMutableAttributedString()
        tf.font = UIFont(name: "Didot-Bold", size: 18)
        tf.textColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        placeholder = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font:font])
        placeholder.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1), range:NSRange(location:0,length:name.count))
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = placeholder
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        let font = UIFont(name: "Didot-Bold", size: 16)
        let titleTextAttributesSelected: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: font!, NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)]
        let titleTextAttributesNormal: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: font!, NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7351993545, green: 0.897208472, blue: 1, alpha: 1)]
        sc.tintColor = #colorLiteral(red: 0.4766276696, green: 0.7647817654, blue: 0.9241949556, alpha: 1)
        sc.setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        sc.selectedSegmentIndex = 1
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(handleLoginRegisterSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc func handleLoginRegisterSegmentChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        nameInputsHeightAnchor?.isActive = false
        nameInputsHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameInputsHeightAnchor?.isActive = true
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
        nameSeperator?.isActive = false
        nameSeperator = nameSeperatorView.heightAnchor.constraint(equalToConstant: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1)
        nameSeperator?.isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorTop = #colorLiteral(red: 0.02932400174, green: 0.2492947049, blue: 0.2076009115, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.02932400174, green: 0.3521321615, blue: 0.2076009115, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(loginLogo)
        view.addSubview(loginRegisterSegmentedControl)

        setupInputContainerView()
        setupLoginRegisterButton()
        setupLoginLogo()
        setupLoginRegisterSegmentedControl()
        
    }
    
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupLoginLogo() {
        loginLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginLogo.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -20).isActive = true
        loginLogo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginLogo.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameInputsHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var nameSeperator: NSLayoutConstraint?

    
    func setupInputContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameInputsHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameInputsHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeperator = nameSeperatorView.heightAnchor.constraint(equalToConstant: 1)
        nameSeperator?.isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(emailSeperatorView)
        emailSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        inputsContainerView.addSubview(passwordTextField)
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }


}
