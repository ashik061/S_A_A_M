import 'package:flutter/material.dart';
import 'package:s_a_a_m/select_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget _title() {
    return const Text('SAAM');
  }

  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, SelectScreen.routeName, (route) => false);
    });

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(),
          ],
        ),
      ),
    );
  }
}
