import Foundation

struct Note: Codable {
  let title: String
  let text: String
  let timestamp: Date
}

let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let notes = [note1, note2, note3]

let desktopDirectory = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
let archieveURL = desktopDirectory.appendingPathComponent("note").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)

try? encodedNote?.write(to: archieveURL, options: [])

let propertyListDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archieveURL),
  let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNoteData) {
    print(decodedNote)
}

