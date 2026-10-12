// swift-tools-version: 6.4

@preconcurrency import PackageDescription

extension PackageDescription.Target.Dependency {
  static let tca: Self = .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
  static let tagged: Self = .product(name: "Tagged", package: "swift-tagged")
}

extension PackageDescription.Target.PluginUsage {
  static let swiftLint: Self = .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
}

let package = Package(
  name: "AppCore",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "AppFeature",
      targets: ["AppFeature"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.26.2"),
    .package(url: "https://github.com/pointfreeco/swift-tagged", exact: "0.10.0"),
    .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.65.1"),

  ],
  targets: [
    .target(
      name: "AppFeature",
      path: "Sources/Features/AppFeature"
    ),
    .target(
      name: "UI"
    ),
  ]
)

for target in package.targets {
  if let path = target.path, path.hasPrefix("Sources/Features/") {
    target.dependencies += [
      "UI",
      .tca,
    ]
  }
  // Pluginを設定
  if target.type == .regular || target.type == .test {
    target.plugins = target.plugins ?? []
    target.plugins?.append(.swiftLint)
  }
}
