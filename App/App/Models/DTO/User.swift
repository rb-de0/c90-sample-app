import Vapor

struct User{
    let name: Valid<Name>
    let password: Valid<Count<String>>

    init(request: Request) throws {
        self.name = try request.data["name"].validated()
        self.password = try request.data["password"].validated(by: Count.containedIn(low: 1, high: 20))
    }
}

struct Name: ValidationSuite{
    static func validate(input value: String) throws {
        if value.characters.count <= 0 || value.characters.count > 20{
            throw CuscomValidationError(errorMessage: "ユーザー名は1文字以上20文字以内で入力してください")
        }
    }
}

struct CuscomValidationError: ErrorProtocol{
    let errorMessage: String
}