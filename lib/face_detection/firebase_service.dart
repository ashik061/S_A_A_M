import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> uploadImageToFirebase(File imageFile, String path) async {

  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref().child(path);

    final  UploadTask = storageRef.putFile(imageFile);
    final snapshot = await UploadTask.whenComplete(() {});

    print('Image uploaded to Firebase Storage at path: $path');
  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
  }
}
