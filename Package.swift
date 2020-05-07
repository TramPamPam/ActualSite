// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "ActualSite",
    products: [
        .executable(name: "ActualSite", targets: ["ActualSite"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.3.0"),
        .package(url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "ActualSite",
            dependencies: ["Publish", "SplashPublishPlugin"]
        )
    ]
)
