import 'package:flutter/material.dart';
import 'package:landing_page/helpers/landingpage.dart';
import 'package:landing_page/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirstTime = await _isFirstTime();

  runApp(MyApp(isFirstTime: isFirstTime));
}

Future<bool> _isFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  if (isFirstTime) {
    prefs.setBool('isFirstTime', false);
  }
  return isFirstTime;
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: isFirstTime ? HomePage() : SignUpPage(),
    );
  }
}
