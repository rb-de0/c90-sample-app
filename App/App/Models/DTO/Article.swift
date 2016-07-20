import Vapor
import MySQL

struct Article: QueryRowResultType{
    let id: Int
    let title: String
    let content: String

    static func decodeRow(r: QueryRowResult) throws -> Article {
        return try Article(
            id: r <| "id",
            title: r <| "title",
            content: r <| "content"
        )
    }
}

// MARK: - StringInitializable
extension Article: StringInitializable{
    init?(from string: String) throws{
        guard let id = Int(string) else{
            return nil
        }
        
        // TODO: DBからデータを取得する
        self = Article(id: 0, title: "hoge", content: "hoge")
    }
}