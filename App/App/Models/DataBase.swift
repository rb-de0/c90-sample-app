import MySQL

struct DataBase{
    struct DataBaseOption: ConnectionOption{
        let host: String
        let port: Int
        let user: String
        let password: String
        let database: String
    }

    private static let options = DataBaseOption(host: "localhost", port: 3306, user: "root", password: "root", database: "test")
    
    static func connectionPool() -> ConnectionPool{
        return ConnectionPool(options: options)
    }
}