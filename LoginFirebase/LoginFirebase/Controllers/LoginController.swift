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
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9632800006, blue: 0.9694557276, alpha: 1)
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
        
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleRegister() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (FIRUser, error) in
            // ...
        }
        print("button pressed")
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
        imageView.image = UIImage(named: "title")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.02932400174, green: 0.3521321615, blue: 0.2076009115, alpha: 1)
        UIApplication.shared.statusBarStyle = .lightContent
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(loginLogo)

        setupInputContainerView()
        setupLoginRegisterButton()
        setupLoginLogo()
        
    }
    
    func setupLoginLogo() {
        loginLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginLogo.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 0).isActive = true
        loginLogo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginLogo.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupInputContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(emailSeperatorView)
        emailSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        inputsContainerView.addSubview(passwordTextField)
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }


}
