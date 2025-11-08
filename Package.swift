// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "AprilTagVisionOS",
  // Add other platforms if you want this to be multi-platform
  platforms: [
    .visionOS(.v26) // min deployment for visionOS
  ],
  products: [
    .library(name: "AprilTagC", targets: ["AprilTagC"])
  ],
  targets: [
    .target(
      name: "AprilTagC",
      path: ".",                // build straight from repo root
      // keep SwiftPM from compiling samples, tests, and python wrapper
      exclude: [
        "example",
        "test",
        ".github",
        "CMake",
        "apriltag_pywrap.c",
        "apriltag_py_type.docstring",
        "apriltag_detect.docstring",
        "package.xml",
        "apriltag.pc.in",
        "README.md",
        "LICENSE.md",
        "CMakeLists.txt"
      ],
      publicHeadersPath: ".",   // expose top-level headers to Swift
      cSettings: [
        .headerSearchPath("common"),
        // Optional performance flags similar to typical release builds
        .unsafeFlags(["-O3", "-ffast-math"])
      ]
    )
  ]
)
