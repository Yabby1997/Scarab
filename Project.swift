import ProjectDescription

let targets: [Target] = [
    Target(
        name: "Scarab",
        platform: .iOS,
        product: .framework,
        bundleId: "com.seunghun.scarab",
        deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
        sources: ["Scarab/Sources/**"],
        dependencies: []
    ),
    Target(
        name: "ScarabDemo",
        platform: .iOS,
        product: .app,
        bundleId: "com.seunghun.scarab.demo",
        deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
        infoPlist: .extendingDefault(
            with: [
                "UILaunchStoryboardName": "LaunchScreen",
            ]
        ),
        sources: ["ScarabDemo/Sources/**"],
        resources: ["ScarabDemo/Resources/**"],
        dependencies: [
            .target(name: "Scarab")
        ],
        settings: .settings(
            base: ["DEVELOPMENT_TEAM": "5HZQ3M82FA"],
            configurations: [],
            defaultSettings: .recommended
        )
    )
]

let project = Project(
    name: "Scarab",
    organizationName: "seunghun",
    targets: targets
)
