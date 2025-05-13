import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'root_app.dart';
import '../theme/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String nickname = "";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        nickname = doc.data()?['nickname'] ?? '';
      });
    }

    // 3 秒后自动跳转主页
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RootApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: AppColor.primary, size: 80),
            const SizedBox(height: 20),
            Text(
              "Welcome, $nickname!",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text("You're successfully registered.",
                style: TextStyle(color: AppColor.labelColor)),
          ],
        ),
      ),
    );
  }
}
