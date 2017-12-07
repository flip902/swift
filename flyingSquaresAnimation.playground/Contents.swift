//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
PlaygroundPage.current.liveView = liveView

liveView.backgroundColor = .white




let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)

square.backgroundColor = .purple

liveView.addSubview(square)

UIView.animate(withDuration: 2.0, animations: {
    square.backgroundColor = .orange
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 350, y: 350)
    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    
    square.transform = comboTransform
}) { (_) in
    UIView.animate(withDuration: 2.0, animations: {
        square.transform = CGAffineTransform.identity
    })
}





