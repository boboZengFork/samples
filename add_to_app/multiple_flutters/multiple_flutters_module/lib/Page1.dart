// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:multiple_flutters_module/main.dart';


@pragma('vm:entry-point')
void main() => runApp(const Page1(color: Colors.purple));

@pragma('vm:entry-point')
void topMain() => runApp(const Page1(color: Colors.green));

@pragma('vm:entry-point')
void bottomMain(List<String> dartEntrypointArgs) {
  print("zengbobo bottomMain dartEntrypointArgs:$dartEntrypointArgs");
  runApp(const MyApp(color: Colors.purple));
}

class Page1 extends StatelessWidget {
  const Page1({Key key, this.color}) : super(key: key);

  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  Page 1',
      theme: ThemeData(
        colorSchemeSeed: color,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 8,
        ),
      ),
      home: const MyHomePage1(title: 'Flutter Demo Page 1'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key key,   this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  int _counter = 0;
  MethodChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('multiple-flutters');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setCount") {
        // A notification that the host platform's data model has been updated.
        setState(() {
          _counter = call.arguments as int;
        });
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  void _incrementCounter() {
    // Mutations to the data model are forwarded to the host platform.
    _channel.invokeMethod<void>("incrementCount", _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/board_ic_finish.png", width: 72, height: 120,),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: _incrementCounter,
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                _channel.invokeMethod<void>("next", _counter);
              },
              child: const Text('Next'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Use the url_launcher plugin to open the Flutter docs in
                // a browser.
                final url = Uri.parse('https://flutter.dev/docs');
                if (await launcher.canLaunchUrl(url)) {
                  await launcher.launchUrl(url);
                }
              },
              child: const Text('Open Flutter Docs'),
            ),
          ],
        ),
      ),
    );
  }
}
