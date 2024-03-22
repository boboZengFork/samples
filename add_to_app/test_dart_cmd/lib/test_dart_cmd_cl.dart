library test_dart_cmd;

Future<int> runCommandLine(List<String> args,
    {Uri? packageConfig, String? sdkPath}) async {
  // return Pigeon.run(args, sdkPath: sdkPath);
  print("zengobo test_dart_cmd runCommandLine ");
  for( var str in args){
    print("zengobo test_dart_cmd runCommandLine str:$str");
  }
  return 0;
}
