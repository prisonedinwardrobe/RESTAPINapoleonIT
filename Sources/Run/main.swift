import App
import Foundation

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands,
/// if no command is given, it will default to "serve"

let config = try Config()
try config.setup()

let drop = try Droplet(config)
try drop.setup()

struct TestResponse: Codable {
    var id: String
    var title: String
    var text: String
    var date_create: TimeInterval
    var date_update: TimeInterval
    
    init(title: String, text: String) {
        
        self.title = title
        self.text = text
        self.id = UUID().uuidString
        self.date_create = Date().timeIntervalSince1970
        self.date_update = date_create
    }
}


struct PostDataBase {
    var posts: [String : TestResponse] = [:]
}
var postDataBase = PostDataBase()

func tryJsonEncode(object: [TestResponse]) -> Any? {
    let encodedObject = try? JSONEncoder().encode(object)
    var jsonObject: Any?
    
    if let encodedObject = encodedObject {
        jsonObject = try? JSONSerialization.jsonObject(with: encodedObject, options: .allowFragments)
    }
    if let jsonObject = jsonObject {
        return jsonObject
    }
    return nil
}

drop.post("") { req in
    guard let title = req.json?["title"]?.string else {
        return "wrong placeholders; required: \"title\":, \"text\":"
    }
    guard let text = req.json?["text"]?.string else {
        return "wrong placeholders; required: \"title\":, \"text\":"
    }
    let newResponse = TestResponse(title: title, text: text)
    postDataBase.posts.updateValue(newResponse, forKey: newResponse.id)
    
    return "note succesfully created!"
}

drop.get("") {_ in
    return "\(String(describing: tryJsonEncode(object: Array(postDataBase.posts.values))!))"
}

drop.delete("") { req in
    guard let idToDelete =  req.json?["id"]?.string else {
        return "wrong placeholders; required: \"id\""
    }
    postDataBase.posts[idToDelete] = nil
    return "\(idToDelete) note is succesfuly deleted!"
}

drop.patch("") { req in
    guard let id = req.json?["id"]?.string else {
        return "wrong placeholders; required: \"id\":, \"title\":, \"text\":"
    }
    guard let title = req.json?["title"]?.string else {
        return "wrong placeholders; required: \"id\":, \"title\":, \"text\":"
    }
    guard let text = req.json?["text"]?.string else {
        return "wrong placeholders; required: \"id\":, \"title\":, \"text\":"
    }
    
    postDataBase.posts[id]?.title = title
    postDataBase.posts[id]?.text = text
    postDataBase.posts[id]?.date_update = Date().timeIntervalSince1970
    
    return "\(id) note succesfully updated!"
}

try drop.run()


