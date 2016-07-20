import MySQL

struct ArticleAccessor{
    
    static func getArticles() -> [Article]{
        do{
            let articles: [Article] = try DataBase.connectionPool().execute { conn in
                try conn.query("SELECT * FROM articles;") 
            }
            return articles
        }catch{
            return []
        }
    }

    static func registerArticle(article: Article) -> Bool{
        do{
            let status: QueryStatus = try DataBase.connectionPool().transaction { conn in
                try conn.query("INSERT INTO articles (title, content) VALUES (?,?);", 
                    [article.title, article.content]) 
            }
            return true
        }catch{
            return false
        }
    }
}