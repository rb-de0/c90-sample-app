import PackageDescription

let package = Package(
    name: "App",
    dependencies: [
        .Package(url: "https://github.com/qutheory/vapor.git", versions: Version(0,12,0)..<Version(0,12,1)),
        .Package(url: "https://github.com/qutheory/vapor-mustache.git", versions: Version(0,8,0)..<Version(0,8,1)),
        .Package(url: "https://github.com/novi/mysql-swift.git", versions: Version(0,2,7)..<Version(0,2,8))
    ],
    exclude: [
        "Config",
        "Public",
        "Resources"
    ]
)
