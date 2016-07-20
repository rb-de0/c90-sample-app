import Vapor

class IndexController: Controller{
    typealias Item = String

    private weak var application: Application!
    
    required init(application: Application) {
        self.application = application
    }

    func index(request: Request) throws -> ResponseRepresentable{
        return try self.application.view("index.mustache", context: ["message": "Mustache"])
    }
}