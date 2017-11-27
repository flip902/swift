import Cocoa

var str = "You've been Hacked by: @FlipCarlino"

// get URL to the the documents directory in the sandbox
let documentsUrl = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0] as NSURL

// add a filename
let fileUrl = documentsUrl.appendingPathComponent("fuct.txt")

// write to it
try! str.write(to: fileUrl!, atomically: true, encoding: String.Encoding.utf8)

print("file saved to: \(String(describing: fileUrl))")
