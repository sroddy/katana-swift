import PackageDescription

var exclude: Set<String> = ["Android", "iOS", "MacOS"]

#if os(Android)
  exclude = excludes - ["Android"]
#elseif os(iOS)
  exclude = excludes - ["iOS"]
#else
  exclude = excludes - ["macOS"]
#endif

let package = Package(
    name: "Katana",
    dependencies: [],
    exclude: Array<String>(exclude)
)
