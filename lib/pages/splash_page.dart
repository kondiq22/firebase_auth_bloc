import 'package:flutter/material.dart';
class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
      
    );
  }
}