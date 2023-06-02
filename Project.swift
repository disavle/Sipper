import ProjectDescription

public var scripts: [TargetScript] {

	var scripts = [TargetScript]()
	
	let swiftLintScriptString = "SwiftLint/swiftlint --fix && SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")
	
	scripts.append(swiftLintScript)
	return scripts
}

let target = Target(
	name: "Sipper",
	platform: .iOS,
	product: .app,
	productName: "Sipper",
	bundleId: "Disavle.Sipper",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
	infoPlist: "Sipper/Configs/Info.plist",
	sources: ["Sipper/Sources/**"],
	resources: ["Sipper/Resources/**"],
	scripts: scripts,
	dependencies: [
		.external(name: "SnapKit")
	]
)

let testTarget = Target(
	name: "SipperTests",
	platform: .iOS,
	product: .unitTests,
	bundleId: "Disavle.SipperTests",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
	sources: "SipperTests/Sources/**",
	dependencies: [
		.target(name: "Sipper"),
		.external(name: "SnapshotTesting")
	]
)

let project = Project(
	name: "Sipper",
	organizationName: "Disavle",
	targets: [target, testTarget],
	schemes: [
		Scheme(
			name: "Sipper",
			shared: true,
			buildAction: .buildAction(targets: ["Sipper"]),
			testAction: .targets(["SipperTests"]),
			runAction: .runAction(executable: "Sipper")
		),
		Scheme(
			name: "SipperTests",
			shared: true,
			buildAction: .buildAction(targets: ["SipperTests"]),
			testAction: .targets(["SipperTests"]),
			runAction: .runAction(executable: "SipperTests")
		),
	]
)

