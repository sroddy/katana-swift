import PackageDescription

var exclude: Set<String> = ["Android", "iOS", "MacOS"]

#if os(Linux)
  exclude.remove("Android")
#elseif os(iOS)
  exclude.remove("iOS")
#else
  exclude.remove("macOS")
#endif

let package = Package(
    name: "Katana",
    dependencies: [],
    exclude: Array<String>(exclude)
)
