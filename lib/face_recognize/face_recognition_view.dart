// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:tflite/tflite.dart';

// class FaceRecognitionPage extends StatefulWidget {
//   const FaceRecognitionPage({super.key});
//   static String routeName = 'FaceRecognitonPage';

//   @override
//   _FaceRecognitionPageState createState() => _FaceRecognitionPageState();
// }

// class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
//   final ImagePicker _picker = ImagePicker();
//   File? _imageFile;
//   List<Face> _faces = [];

//   @override
//   void initState() {
//     super.initState();

//     // Load the TensorFlow Lite model
//     loadModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Face Recognition'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _imageFile != null
//               ? Image.file(_imageFile!)
//               : Text('No image selected'),
//           ElevatedButton(
//             onPressed: _pickImageFromCamera,
//             child: Text('Take Picture'),
//           ),
//           ElevatedButton(
//             onPressed: _pickImageFromGallery,
//             child: Text('Pick from Gallery'),
//           ),
//           SizedBox(height: 20),
//           Text('Detected Faces: ${_faces.length}'),
//         ],
//       ),
//     );
//   }

//   void loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/face_recog_vgg_new.tflite",
//       labels: "assets/labels.txt",
//     );
//   }

//   Future<void> _pickImageFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     _processImage(pickedFile as PickedFile?);
//   }

//   Future<void> _pickImageFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     _processImage(pickedFile as PickedFile?);
//   }

//   Future<void> _processImage(PickedFile? pickedFile) async {
//     if (pickedFile == null) return;

//     setState(() {
//       _imageFile = File(pickedFile.path);
//       _imageFile;
//       _faces = [];
//     });

//     final inputImage = InputImage.fromFilePath(pickedFile.path);

//     final faceDetector = GoogleMlKit.vision.faceDetector();
//     final List<Face> faces = await faceDetector.processImage(inputImage);

//     // Read the image file as bytes
//     Uint8List imageBytes = await _imageFile!.readAsBytes();

//     // Convert the image to a format suitable for the model
//     var recognitions = await Tflite.runModelOnBinary(
//       binary: imageBytes,
//       numResults: 2,
//       threshold: 0.1,
//     );

//     // Print the predicted names on the console
//     for (var recognition in recognitions!) {
//       print(
//           "Predicted Name: ${recognition["label"]}, Confidence: ${recognition["confidence"]}");
//     }

//     setState(() {
//       _faces = faces;
//     });

//     await faceDetector.close();
//   }
// }
