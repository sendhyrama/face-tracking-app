import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPreviewPage({super.key, required this.camera});

  @override
  _CameraPreviewPageState createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller using the front camera passed from HomePage
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Preview'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Camera is initialized, show the camera preview
            return CameraPreview(_controller);
          } else {
            // Camera is not initialized, show loading indicator
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
