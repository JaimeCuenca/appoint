import 'package:appoint/src/app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.toString());
  runApp(MyApp());
}
