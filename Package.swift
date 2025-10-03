// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Agentchains.ai",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Agentchains.ai",
            targets: ["Agentchains.ai"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.20.0")
    ],
    targets: [
        .target(
            name: "Agentchains.ai",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
            ])
    ]
)
