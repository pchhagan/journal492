import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'db/database_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  //await DatabaseManager.initialize();
  runApp(App(preferences: await SharedPreferences.getInstance()));
}