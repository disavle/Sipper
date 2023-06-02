import ProjectDescription

let dependencies = Dependencies(
	swiftPackageManager: [
		.remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.6.0")),
		.remote(url: "https://github.com/pointfreeco/swift-snapshot-testing", requirement: .upToNextMajor(from: "1.11.0"))
	],
	platforms: [.iOS]
)
