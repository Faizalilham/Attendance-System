import 'package:attendance_system/app/modules/detections/controllers/detections_controller.dart';
import 'package:attendance_system/app/modules/detections/views/components/models.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'camera.dart';
import 'bndbox.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  _CameraScreenState createState() => new _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final controller = Get.put(DetectionsController());
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    try {
      final res = (await Tflite.loadModel(
        model: "assets/x/model.tflite",
        labels: "assets/x/labelmap.txt",
      ))!;
      print("Model loaded successfully $res");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  onSelect() {
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;

      for (var recognition in _recognitions!) {
        print('Detected label: ${recognition["detectedClass"]}');
        controller.processDetectedStudent("${recognition["detectedClass"]}");
        print("${controller.listStudent}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    onSelect();
    return Scaffold(
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            mobilenet,
            setRecognitions,
          ),
          BndBox(
              _recognitions ?? [],
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              mobilenet),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              height: 50,
              width: 50,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}