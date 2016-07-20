import Vapor
import VaporMustache

let mustacheProvider = VaporMustache.Provider(withIncludes: [:])
let config = Config(environment: .development)
let app = Application(providers: [mustacheProvider], config: config)

// ルーティング
app.get("/") { request in
    return try app.view("index.html")
}

app.get("/", Int.self) { request, name in
    return "Hello \(name)"
}

app.post("/") { request in
    return "Hello Vapor"
}

app.get("/articles", Article.self){ request, article in
    return "\(article.content)"
}

app.get("/json"){request in
    return Response(body: JSON(["message": "ok"]))
}

app.get("/redirect"){request in
    return Response(redirect: "/")
}

app.get("/cookie"){request in
    let response = Response(body: JSON(["message": "ok"]))
    response.cookies["id"] = "123"
    
    return response
}

app.post("/session"){request in
    guard let name = request.data["name"].string else{
        return "No data"
    }

    request.session?["name"] = name
    return "Session set"
}

app.get("/session"){request in
    guard let name = request.session?["name"] else {
        return "No session data"
    }

    return name
}

app.post("/user"){request in
    do{
        let newUser = try User(request: request)
        return "Registered \(newUser.name.value)"
    }catch let error as ValidationError<Count<String>>{
        print(error.input)
        print(error.inputDescription)
        return error.message
    }
}

app.get("/articles"){request in
    let articles = ArticleAccessor.getArticles()
    return articles.map{$0.content}.joined(separator: ":")
}

app.post("/articles"){request in
    let article = Article(id: 0, title: "hoge", content: "hoge_content")
    let result = ArticleAccessor.registerArticle(article: article)
    return String(result)
}

// Controller
app.resource("/index", controller: IndexController.self)

app.start()