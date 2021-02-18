import 'package:flutter/material.dart';
import 'package:flutter_api_example/UI/my_home.dart';
import 'package:flutter_api_example/network/api_service.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print("${event.level.name}: ${event.time} : ${event.message}");
  });
}

class MyApp extends StatelessWidget {
  static const String _title = "Flutter API";
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        title: _title,
        home: MyHome(title: _title),
      ),
    );
  }
}
