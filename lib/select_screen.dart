import 'package:s_a_a_m/auth.dart';
import 'package:flutter/material.dart';
import 'package:s_a_a_m/screens/home.dart';
import 'package:s_a_a_m/screens/login_and_register.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return const LoginRegister();
        }
      },
    );
  }
}
