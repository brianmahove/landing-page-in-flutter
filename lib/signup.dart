import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sign Up Page')),
        body: Center(
          child: Text(
            'Welcome to the Sign Up Page!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
