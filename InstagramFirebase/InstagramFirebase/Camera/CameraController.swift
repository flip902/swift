//
//  CameraController.swift
//  InstagramFirebase
//
//  Created by Phillip Carlino on 2018-03-17.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController, AVCapturePhotoCaptureDelegate, UIViewControllerTransitioningDelegate {
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "right_arrow_shadow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    let capturePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "capture_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCapturePhoto), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
        setupCaptureSession()
        setupHUD()
    }
    
    let customAnimationPresentor = CustomAnimationPresentor()
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationPresentor
    }
    let customAnimationDismisser = CustomAnimationDismisser()
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationDismisser
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setupHUD() {
        view.addSubview(capturePhotoButton)
        capturePhotoButton.anchor(top: nil, right: nil, bottom: view.bottomAnchor, left: nil, paddingTop: 0, paddingRight: 0, paddingBottom: 24, paddingLeft: 0, width: 80, height: 80)
        capturePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(dismissButton)
        dismissButton.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: nil, left: nil, paddingTop: 12, paddingRight: 12, paddingBottom: 0, paddingLeft: 0, width: 50, height: 50)
    }
    
    @objc func handleCapturePhoto() {
        print("Capturing Photo")
        
        let settings = AVCapturePhotoSettings()
        guard let previewFormatType = settings.availablePreviewPhotoPixelFormatTypes.first else { return }
        settings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewFormatType]
        
        
        output.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        let previewImage = UIImage(data: imageData)
        let containerView = PreviewPhotoContainerView()
        containerView.previewImageView.image = previewImage
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 0, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, width: 0, height: 0)
        
        
    }
    
    let output = AVCapturePhotoOutput()
    
    fileprivate func setupCaptureSession() {
        let captureSession = AVCaptureSession()
        
        //1. setup inputs
        let captureDevice = AVCaptureDevice.default(for: .video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
        } catch let err {
            print("Could not setup camera input:", err)
        }
        //2. setup outputs
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
        }
        //3. setup output preview
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }

}
