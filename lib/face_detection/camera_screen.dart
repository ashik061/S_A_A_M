import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:s_a_a_m/screens/home_class.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;

import 'package:s_a_a_m/face_detection/firebase_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  static String routeName = "CameraScreen";

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;
  late Timer _timer;
  bool _shouldCapture = true;
  List<Face> _detectedFaces = [];
  static int random = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[1], ResolutionPreset.medium);

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraReady = true;
      });
      _startPeriodicCapture();
      _stopCamera();
     
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _stopCamera() {
    _timer = Timer(Duration(seconds: 10), () {
      _timer.cancel();
      if (mounted) {
        _shouldCapture = false;
        _controller.stopImageStream();
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassesHome(),
          ),
        );
        dispose();
      }
    });
  }

  void _startPeriodicCapture() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted && _shouldCapture && !_controller.value.isTakingPicture) {
        _captureImage();
         random++;
      }
    });
  }

  Future<void> _captureImage() async {
    if (_controller.value.isTakingPicture) {
      return;
    }

    try {
      final XFile picture = await _controller.takePicture();
      final File imageFile = File(picture.path);

      String userEmail =
          FirebaseAuth.instance.currentUser?.email ?? 'unknown_user';

      final InputImage visionImage = InputImage.fromFilePath(imageFile.path);
      final options = FaceDetectorOptions();
      final faceDetector = FaceDetector(options: options);
      final List<Face> faces = await faceDetector.processImage(visionImage);

      setState(() {
        _detectedFaces = faces;
      });

      faceDetector.close();

      await uploadImageToFirebase(imageFile, '$userEmail/original');

      final Face face = _detectedFaces[0];
      final File croppedFace = await _cropFace(imageFile, face);
      await uploadImageToFirebase(croppedFace, '$userEmail/face_$random');

      // for (int i = 0; i < _detectedFaces.length; i++) {
      //   final Face face = _detectedFaces[i];
      //   final File croppedFace = await _cropFace(imageFile, face);
      //   await uploadImageToFirebase(croppedFace, '$userEmail/face_$i');
      // }

      print('Picture captured and faces detected: ${picture.path}');
    } catch (e) {
      print('Error capturing picture: $e');
    }
  }

  Future<File> _cropFace(File imageFile, Face face) async {
    final String filePath = imageFile.path;
    final List<int> bytes = await imageFile.readAsBytes();
    final img.Image originalImage = img.decodeImage(Uint8List.fromList(bytes))!;

    final int x = face.boundingBox.left.toInt();
    final int y = face.boundingBox.top.toInt();
    final int width = face.boundingBox.width.toInt();
    final int height = face.boundingBox.height.toInt();

    final img.Image croppedFace =
        img.copyCrop(originalImage,x,y,width,height);
    final Uint8List croppedBytes =
        Uint8List.fromList(img.encodeJpg(croppedFace));

    final String croppedFilePath = '${filePath}_cropped.jpg';
    final File croppedFile = File(croppedFilePath);
    await croppedFile.writeAsBytes(croppedBytes);

    return croppedFile;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraReady) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Screen'),
      ),
      body: Stack(
        children: [
          CameraPreview(_controller),
          CustomPaint(
            painter: FacePainter(_detectedFaces),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _captureImage,
            tooltip: 'Capture Image',
            child: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final List<Face> faces;

  FacePainter(this.faces);

@override
void paint(Canvas canvas, Size size) {
  final Paint paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  for (Face face in faces) {
    final Rect boundingBox = face.boundingBox!;
    final double left = (boundingBox.left * size.width).clamp(0, size.width - 1);
    final double top = (boundingBox.top * size.height).clamp(0, size.height - 1);
    final double right = (boundingBox.right * size.width).clamp(0, size.width - 1);
    final double bottom = (boundingBox.bottom * size.height).clamp(0, size.height - 1);

    final Rect rect = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(rect, paint);
  }
}



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
