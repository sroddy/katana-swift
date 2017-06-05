import PackageDescription

var exclude: Set<String> = ["Android", "iOS", "MacOS"]

#if os(Android)
  exclude = exclude - ["Android"]
#elseif os(iOS)
  exclude = exclude - ["iOS"]
#else
  exclude = exclude - ["macOS"]
#endif

let package = Package(
    name: "Katana",
    dependencies: [],
    exclude: Array<String>(exclude)
)
