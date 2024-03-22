import 'dart:io';

import 'package:test_dart_cmd/test_dart_cmd_cl.dart';

Future<void> main(List<String> args) async {
  exit(await runCommandLine(args));
}
