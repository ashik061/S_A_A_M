import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key});
  static String routeName = 'FaceRecognitonPage';

  @override
  _FaceRecognitionPageState createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  List<Face> _faces = [];
  late Interpreter interpreter;
  List<String> _students_present = [];

  @override
  void initState() {
    super.initState();

    // Load the TensorFlow Lite model
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Recognition'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageFile != null
              ? Image.file(_imageFile!)
              : Text('No image selected'),
          ElevatedButton(
            onPressed: _pickImageFromCamera,
            child: Text('Take Picture'),
          ),
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            child: Text('Pick from Gallery'),
          ),
          SizedBox(height: 20),
          Text('Detected Faces: ${_faces.length}'),
        ],
      ),
    );
  }

  void loadModel() async {
    try {
      // Create interpreter from asset.
      Interpreter interpreter =
          await Interpreter.fromAsset("assets/face_recog_vgg_new.tflite");
    } catch (e) {
      print('Error loading model: ' + e.toString());
    }
    // await Tflite.loadModel(
    //   model: "assets/face_recog_vgg_new.tflite",
    //   labels: "assets/labels.txt",
    // );
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _processImage(pickedFile as PickedFile?);
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _processImage(pickedFile as PickedFile?);
  }

  Future<void> _processImage(PickedFile? pickedFile) async {
    if (pickedFile == null) return;

    setState(() {
      _imageFile = File(pickedFile.path);
      _imageFile;
      _faces = [];
    });

    final inputImage = InputImage.fromFilePath(pickedFile.path);

    final faceDetector = GoogleMlKit.vision.faceDetector();
    final List<Face> faces = await faceDetector.processImage(inputImage);

    // Read the image file as bytes
    Uint8List imageBytes = await _imageFile!.readAsBytes();


    for( Face face in faces){

          //Initialization code
      //Create an ImageProcessor with all ops required. For more ops, please
      //refer to the ImageProcessor Ops section in this README.
      ImageProcessor imageProcessor = ImageProcessorBuilder()
          .add(ResizeOp(64, 64, ResizeMethod.NEAREST_NEIGHBOUR))
          .build();

      // Create a TensorImage object from a File
      TensorImage tensorImage = TensorImage.fromFile(face as File);

      // Preprocess the image.
      // The image for imageFile will be resized to (64, 64)
      tensorImage = imageProcessor.process(tensorImage);

      // Hence, the 'DataType' is defined as UINT8 (8-bit unsigned integer)
      TensorBuffer probabilityBuffer =
          TensorBuffer.createFixedSize(<int>[1, 1001], TfLiteType.uint8);

      // Post-processor which dequantize the result
      SequentialProcessor<TensorBuffer> probabilityProcessor =
          TensorProcessorBuilder().add(DequantizeOp(0, 1 / 255.0)).build();
      TensorBuffer dequantizedBuffer =
          probabilityProcessor.process(probabilityBuffer);

      List<String> labels = await FileUtil.loadLabels("assets/labels.txt");
      TensorLabel tensorLabel = TensorLabel.fromList(
          labels, probabilityProcessor.process(probabilityBuffer));

      interpreter.run(tensorImage.buffer, probabilityBuffer.buffer);

      Map<String, double> doubleMap = tensorLabel.getMapWithFloatValue();

      // Quantization Params of input tensor at index 0
      QuantizationParams inputParams = interpreter.getInputTensor(0).params;

      // Quantization Params of output tensor at index 0
      QuantizationParams outputParams = interpreter.getOutputTensor(0).params;


    }



    // Convert the image to a format suitable for the model
    // var recognitions = await Tflite.runModelOnBinary(
    //   binary: imageBytes,
    //   numResults: 2,
    //   threshold: 0.1,
    // );

    // Print the predicted names on the console
    // for (var recognition in recognitions!) {
    //   print(
    //       "Predicted Name: ${recognition["label"]}, Confidence: ${recognition["confidence"]}");
    // }

    setState(() {
      _faces = faces;
    });

    await faceDetector.close();
  }
}
