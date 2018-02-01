//: Playground - noun: a place where people can play

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, width: CGFloat, height: CGFloat) {
        
        if let top = top {
            self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let right = right {
            self.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let left = left {
            self.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

