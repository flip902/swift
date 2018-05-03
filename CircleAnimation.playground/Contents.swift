import UIKit
import PlaygroundSupport

class MyPlaygroundView: UIViewController {
    
    
    
    let shapeLayer = CAShapeLayer()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    override func loadView() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        let view = UIView(frame: frame)
        view.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.7568627451, blue: 0.5137254902, alpha: 1)
        self.view = view
        
        
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
    
        let trackLayer = CAShapeLayer()
        
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 60, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.7076940536, green: 0.6990507841, blue: 0.6990718842, alpha: 1)
        trackLayer.lineWidth = 10
        trackLayer.lineCap = kCALineCapRound
        trackLayer.fillColor = #colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9450980392, alpha: 1)
        trackLayer.position = view.center
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.6196078431, green: 0.3529411765, blue: 0.8352941176, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.position = view.center
        
        shapeLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        
        shapeLayer.strokeEnd = 0
        
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        view.addSubview(percentageLabel)
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    fileprivate func animateCircle() {

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        var percentage: CGFloat = 0
        for i in 1...50 {
            percentage = CGFloat(i) / CGFloat(100)
            //print(percentage)
          }
    
        
        basicAnimation.toValue = percentage
        basicAnimation.duration = 1
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
      
        
        shapeLayer.add(basicAnimation, forKey: "basic")
    }
    
    @objc private func handleTap() {
     
       animateCircle()

    }
    
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = MyPlaygroundView()









