// main.swift

import Cocoa

// APP CLASS
class AppDelegate: NSObject, NSApplicationDelegate {
    var newWindow: NSWindow?
    var controller: ViewController?

    override init() {
        print("App")
        super.init()
        mainView()
    }

    func mainView() {
        print("View")
        newWindow   = NSWindow(contentRect: NSMakeRect(10, 10, 200, 200), styleMask: [.titled, .resizable, .closable], backing: .buffered, defer: false)
        newWindow?.title = "Hacked Bitch!"
        let content = newWindow!.contentView! as NSView
        controller  = ViewController()
        //controller?.loadView()
        let view = controller!.view
        content.addSubview(view)
        newWindow!.makeKeyAndOrderFront(nil)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        print("Launch")  // Not showing this?
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        print("Bye")
        return true
    }
}

// MAIN VIEW CONTROLLER
class ViewController : NSViewController {
    var name = "Main"
    var button: NSButton?

    @objc func onClick(_: Any) {
        print("Click")
    }

    override func loadView() {
        print("Load")
        let view = NSView(frame: NSMakeRect(0,0,200,200))
        view.wantsLayer = true
        view.layer?.borderWidth = 2
        view.layer?.borderColor = NSColor.red.cgColor
        button = NSButton(frame: NSMakeRect(20, 20, 100, 32))
        button?.target = self
        button?.action = #selector(onClick)
        view.addSubview(button!)
        self.view = view
    }
}

// MAIN 
print("Init")
let app = NSApplication.shared
let delegate = AppDelegate()  // alloc main app's delegate class
app.delegate = delegate      // set as app's delegate
app.run()
//let ret = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
//NSApplicationMain(Process.argc, Process.unsafeArgv)
print("End")

// END
