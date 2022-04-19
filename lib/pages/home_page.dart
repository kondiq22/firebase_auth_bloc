import 'dart:ui';

import 'package:firebase_auth_bloc/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) {
                    return ProfilePage();
                  })),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(SignoutRequestedEvent());
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bloc_logo_full.png',
                width: 350,
              ),
              SizedBox(height: 20),
              Text(
                'Bloc is an awersome!\nThe best state management\nfor flutter!!!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
