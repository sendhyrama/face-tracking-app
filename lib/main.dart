import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras
          .first);

  runApp(MyApp(camera: frontCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Camera Preview App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(camera: camera));
  }
}
