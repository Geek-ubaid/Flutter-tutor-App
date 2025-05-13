import 'package:course_clone/screens/root_app.dart';
import 'package:course_clone/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import '../theme/color.dart';
// import 'welcome_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nicknameController = TextEditingController();
  String selectedGender = "Male";
  DateTime? birthDate;

  void register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final nickname = nicknameController.text.trim();

    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$");
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      _showDialog("Invalid Email", "Please enter a valid email address.");
      return;
    }

    if (!passwordRegex.hasMatch(password)) {
      _showDialog(
        "Weak Password",
        "Password must contain:\n"
            "- 1 uppercase letter\n- 1 lowercase letter\n"
            "- 1 number\n- 1 special character\n- min 8 characters.",
      );
      return;
    }

    if (nickname.isEmpty) {
      _showDialog("Missing Name", "Please enter your nickname.");
      return;
    }

    if (birthDate == null) {
      _showDialog("Missing Birthday", "Please select your birth date.");
      return;
    }

    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = cred.user?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          "uid": uid,
          "email": email,
          "nickname": nickname,
          "gender": selectedGender,
          "birthDate": DateFormat('yyyy-MM-dd').format(birthDate!),
          "createdAt": FieldValue.serverTimestamp(),
        });

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_uid', uid);

        Navigator.pushReplacement(
          context,
          // MaterialPageRoute(builder: (_) => const HomePage()),
          MaterialPageRoute(builder: (_) => RootApp()),
        );
      }
    } catch (e) {
      _showDialog("Registration Failed", e.toString());
    }
  }

  void _showDialog(String title, String msg) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  Future<void> pickBirthDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => birthDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Center(
              child: CustomImage(
                "assets/icon/logo.png",
                width: 100,
                isNetwork: false,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor,
              ),
            ),
            const SizedBox(height: 24),
            _inputField(nicknameController, "Nickname"),
            const SizedBox(height: 12),
            _inputField(emailController, "Email"),
            const SizedBox(height: 12),
            _inputField(passwordController, "Password", isPassword: true),
            const SizedBox(height: 12),
            _genderPicker(),
            const SizedBox(height: 12),
            _birthdayPicker(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 16, color: AppColor.sky),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed:
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  ),
              child: Text(
                "Already have an account? Login",
                style: TextStyle(color: AppColor.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    TextEditingController ctrl,
    String hint, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: ctrl,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.textBoxColor,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
    );
  }

  Widget _genderPicker() {
    return Row(
      children: [
        const Text("Gender:"),
        const SizedBox(width: 12),
        DropdownButton<String>(
          value: selectedGender,
          onChanged: (val) => setState(() => selectedGender = val!),
          items:
              [
                "Male",
                "Female",
                "Other",
              ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
        ),
      ],
    );
  }

  Widget _birthdayPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          birthDate == null
              ? "Select birth date"
              : "Birthday: ${DateFormat('yyyy-MM-dd').format(birthDate!)}",
        ),
        ElevatedButton(onPressed: pickBirthDate, child: const Text("Pick")),
      ],
    );
  }
}
