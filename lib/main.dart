import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:s_a_a_m/firebase_options.dart';
import 'package:s_a_a_m/routes.dart';
import 'package:s_a_a_m/screens/splash_screen.dart';

//importing file for face detection


import 'package:s_a_a_m/painters/face_detector_painter.dart';
import 'package:s_a_a_m/painters/coordinates_translator.dart';
//import 'package:s_a_a_m/face_recognize/face_recognition_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAAM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      //home: const SelectScreen(),
    );
  }
}
