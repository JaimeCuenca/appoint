import 'package:appoint/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
