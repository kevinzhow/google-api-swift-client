// swift-tools-version:5.5

// Copyright 2019 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import PackageDescription

let package = Package(
  name: "google-api-swift-client",
  platforms: [
    .macOS(.v10_15), .iOS(.v9), .tvOS(.v9)
  ],
  products: [
    .library(name: "GoogleAPIRuntime", targets: ["GoogleAPIRuntime"]),
    .library(name: "Discovery", targets: ["Discovery"]),
  ],
  dependencies: [
    .package(url: "https://github.com/kevinzhow/google-auth-library-swift.git", revision: "533f421a789c02eb203ea657cf04006f1208046f"),

  ],
  targets: [
    .target(name: "google-api-swift-generator", dependencies: ["Discovery"], path: "Sources/google-api-swift-generator"),
    .target(name: "google-cli-swift-generator", dependencies: ["Discovery"], path: "Sources/google-cli-swift-generator"),
    .target(name: "GoogleAPIRuntime", dependencies: [.product(name: "OAuth2", package: "google-auth-library-swift")], path: "Sources/GoogleAPIRuntime"),
    .target(name: "Discovery", dependencies: [], path: "Sources/Discovery"),
  ]
)
