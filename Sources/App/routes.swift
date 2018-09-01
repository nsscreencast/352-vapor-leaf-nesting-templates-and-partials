import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    struct UserPage : Codable {
        var user: String?
        var categories: [String]
    }
    
    func getHello(_ req: Request) throws -> Future<View> {
        let user = try? req.parameters.next(String.self)
        let context = UserPage(user: user, categories:  [
            "Articles", "Recipes", "Reviews"
            ])
        return try req.view().render("hello", context)
    }
    
    router.get("hello", use: getHello)
        
    // hello/ben
    router.get("hello", String.parameter, use: getHello)
}
