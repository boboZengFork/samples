# multiple_flutters_android

This is an add-to-app sample that uses the Flutter engine group API to host
multiple instances of Flutter in the app.

## Getting Started

```sh
cd ../multiple_flutters_module
flutter pub get
cd -
open -a "Android Studio" multiple_flutters_android/ # macOS command
# (build and run)
```

For more information see
[multiple_flutters_module](../multiple_flutters_module/README.md).



public DartEntrypoint(
    @NonNull String pathToBundle,
    @NonNull String dartEntrypointLibrary,
    @NonNull String dartEntrypointFunctionName) {
    this.pathToBundle = pathToBundle;
    this.dartEntrypointLibrary = dartEntrypointLibrary;
    this.dartEntrypointFunctionName = dartEntrypointFunctionName;
    }

pathToBundle
    - 资源文件路径：多engine不能同时生效
dartEntrypointLibrary
    - 入口dart文件路径
dartEntrypointFunctionName
    - 函数入口点






























