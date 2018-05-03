//
//  SharePhotoController.swift
//  InstagramFirebase
//
//  Created by Phillip Carlino on 2018-01-29.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit
import Firebase

class SharePhotoController: UIViewController {
    
    var selectedImage: UIImage? {
        didSet {
            self.imageView.image = selectedImage
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handleShare))
        setupImageAndTextViews()
        
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    fileprivate func setupImageAndTextViews() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 0, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, width: 0, height: 100)
        
        containerView.addSubview(imageView)
        imageView.anchor(top: containerView.topAnchor, right: nil, bottom: containerView.bottomAnchor, left: containerView.leftAnchor, paddingTop: 8, paddingRight: 0, paddingBottom: 8, paddingLeft: 8, width: 84, height: 0)
        
        containerView.addSubview(textView)
        textView.anchor(top: containerView.topAnchor, right: containerView.rightAnchor, bottom: containerView.bottomAnchor, left: imageView.rightAnchor, paddingTop: 0, paddingRight: 0, paddingBottom: 0, paddingLeft: 4, width: 0, height: 0)
    }
    
    @objc func handleShare() {
        guard let caption = textView.text, caption.count > 0 else { return }
        guard let image = selectedImage else { return }
        guard let uploadData = UIImageJPEGRepresentation(image, 0.5) else { return }
        navigationItem.rightBarButtonItem?.isEnabled = false
        let filename = NSUUID().uuidString
        Storage.storage().reference().child("posts").child(filename).putData(uploadData, metadata: nil) { (metadata, err) in
            if let err = err {
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                print("Failed to upload post image:", err)
                return
            }
            guard let imageUrl = metadata?.downloadURL()?.absoluteString else { return }
            print("Successfully uploaded post image:", imageUrl)
            
            self.saveToDatabaseWithImageUrl(imageUrl: imageUrl)
        }
    }
    
    static let updateFeedNotificationName = NSNotification.Name(rawValue: "UpdateFeed")
    
    fileprivate func saveToDatabaseWithImageUrl(imageUrl: String) {
        guard let postImage = selectedImage else { return }
        guard let caption = textView.text else { return }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userPostRef = Database.database().reference().child("posts").child(uid)
        let ref = userPostRef.childByAutoId()
        let values = ["imageUrl": imageUrl, "caption": caption, "imageWidth": postImage.size.width, "imageHeight": postImage.size.height, "creationDate": Date().timeIntervalSince1970] as [String : Any]
        ref.updateChildValues(values) { (err, ref) in
            if let err = err {
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                print("failed to save post to DB", err)
                return
            }
            print("Successfully saved post to DB")
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
