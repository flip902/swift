

import UIKit
import PlaygroundSupport

class MyPlaygroundViewController: UIViewController {
    
    var countingLabel: CountingLabel = {
        let label = CountingLabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        
        label.count(fromValue: 0, to: 100, withDuration: 4, withAnimationType: .EaseOut, withCounterType: .Int)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        let view = UIView(frame: frame)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(countingLabel)
        countingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
}

class CountingLabel: UILabel {
    
    let counterVelocity: Float = 3.0
    
    enum CounterAnimationType {
        case Linear
        case EaseIn
        case EaseOut
    }
    
    enum CounterType {
        case Int
        case Float
    }
    
    var startNumber: Float = 0.0
    var endNumber: Float = 0.0
    
    var progress: TimeInterval!
    var duration: TimeInterval!
    var lastUpdate: TimeInterval!
    
    var timer: Timer?
    
    var counterType: CounterType!
    var counterAnimationType: CounterAnimationType!
    
    var currentCounterValue: Float {
        if progress >= duration {
            return endNumber
        }
        let percentage = Float(progress / duration)
        let update = updateCounter(counterValue: percentage)
        return startNumber + (update * (endNumber - startNumber))
    }
    
    func count(fromValue: Float, to toValue: Float, withDuration duration: TimeInterval, withAnimationType animationType: CounterAnimationType, withCounterType counterType: CounterType) {
        
        self.startNumber = fromValue
        self.endNumber = toValue
        self.duration = duration
        self.counterType = counterType
        self.counterAnimationType = animationType
        self.progress = 0
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        invalidateTimer()
        
        if duration == 0 {
            updateText(value: toValue)
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CountingLabel.updateValue), userInfo: nil, repeats: true)
    }
    
    @objc func updateValue() {
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        if progress >= duration {
            invalidateTimer()
            progress = duration
        }
        updateText(value: currentCounterValue)
    }
    
    func updateText(value: Float) {
        switch counterType! {
        case .Int:
            self.text = "\(Int(value))"
        case .Float:
            self.text = String(format: "%.2f", value)
        }
    }
    
    func updateCounter(counterValue: Float) -> Float {
        switch counterAnimationType {
        case .Linear:
            return counterValue
        case .EaseIn:
            return powf(counterValue, counterVelocity)
        case .EaseOut:
            return 1.0 - powf(1.0 - counterValue, counterVelocity)
        case .none:
            return counterValue
        default:
            return counterValue
        }
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
}
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = MyPlaygroundViewController()

