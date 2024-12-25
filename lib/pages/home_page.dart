import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_preview_page.dart';

class HomePage extends StatelessWidget {
  final CameraDescription camera;

  const HomePage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Time Face Tracking App'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPreviewPage(camera: camera),
              ),
            );
          },
          child: const Text("Open Camera Preview"),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
