//: Views

import UIKit

class MyViewController: UIViewController {
    
    let bluejaysView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "bluejays.jpg"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.setTitle("my button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(gotoView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func gotoView() {
        print("Button pressed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(bluejaysView)
        NSLayoutConstraint.activate([
            bluejaysView.topAnchor.constraint(equalTo: view.topAnchor),
            bluejaysView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bluejaysView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bluejaysView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bluejaysView.heightAnchor.constraint(equalToConstant: view.frame.height),
            bluejaysView.widthAnchor.constraint(equalToConstant: view.frame.width)])
        
        
    }
}

import PlaygroundSupport
PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyViewController())

