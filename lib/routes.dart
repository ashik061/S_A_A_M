import 'package:flutter/material.dart';

import 'package:s_a_a_m/screens/splash_screen.dart';
import 'package:s_a_a_m/select_screen.dart';
//import 'package:s_a_a_m/face_recognize/face_recognition_view.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SelectScreen.routeName: (context) => const SelectScreen(),
  
  //FaceRecognitionPage.routeName: (context) => const FaceRecognitionPage(),
};


