import 'package:flutter/material.dart';
import 'package:s_a_a_m/screens/face_scan.dart';
import 'package:s_a_a_m/screens/splash_screen.dart';
import 'package:s_a_a_m/select_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SelectScreen.routeName: (context) => const SelectScreen(),
  FaceScan.routeName: (context) => const FaceScan(),
};
