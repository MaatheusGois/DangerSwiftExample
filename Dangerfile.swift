import DangerSwiftCoverage // package: https://github.com/f-meloni/danger-swift-coverage.git

Coverage.xcodeBuildCoverage(
    .derivedDataFolder("temp/derived"),
    minimumCoverage: 50,
    excludedTargets: ["DangerSwiftCoverageTests.xctest"]
)
