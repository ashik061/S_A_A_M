import 'package:s_a_a_m/auth.dart';
import 'package:flutter/material.dart';
import 'package:s_a_a_m/screens/home.dart';
import 'package:s_a_a_m/screens/home_class.dart';
import 'package:s_a_a_m/screens/login_and_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});
  static String routeName = 'SelectScreen';

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
          // Get the current user
          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            // Extract user email
            String userEmail = user.email ?? '';

            // Reference to the user's photo folder in Firebase Storage
            Reference userPhotoFolderRef = FirebaseStorage.instance.ref().child(userEmail);

            // Check if the folder exists
            var folderExists = ( userPhotoFolderRef.listAll());
            if(folderExists!=Null) return ClassesHome();
          }
          
          return Home();
        } else {
          return const LoginRegister();
        }
      }
      
    );
  }
}
