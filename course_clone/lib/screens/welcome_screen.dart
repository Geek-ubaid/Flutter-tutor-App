import 'package:flutter/material.dart';
import 'package:course_clone/screens/home.dart';
import 'package:provider/provider.dart';
import '../models/course_model.dart';
import 'root_app.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Flutter Tutor App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                // MaterialPageRoute(builder: (_) => HomePage()),
                MaterialPageRoute(builder: (_) => RootApp()),
              );
            },
            child: Text('Get Started'),
          ),
          ],
        ),
      ),
    );
  }
}