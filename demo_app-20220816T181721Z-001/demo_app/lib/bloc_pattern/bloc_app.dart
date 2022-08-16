import 'package:flutter/material.dart';
import 'package:demo_app/bloc_pattern/screens/login_screen.dart';
import 'blocs/providers.dart';

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      key: key,
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
