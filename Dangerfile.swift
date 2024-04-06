import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git

Coverage.xcodeBuildCoverage(
    .xcresultBundle("fastlane/test_output/Tests-CI.xcresult"),
    minimumCoverage: 50,
    excludedTargets: ["DangerSwiftCoverageTests.xctest"]
)
