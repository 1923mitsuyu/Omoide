// swift-tools-version: 6.4

@preconcurrency import PackageDescription

extension PackageDescription.Target.PluginUsage {
    static let swiftLint: Self = .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
}

let package = Package(
    name: "AppCore",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.65.1")
    ],
    targets: [
        .target(
            name: "AppFeature",
        ),
    ]
)

for target in package.targets {
    // Pluginを設定
    if target.type == .regular || target.type == .test {
        target.plugins = target.plugins ?? []
        target.plugins?.append(.swiftLint)
    }
}
