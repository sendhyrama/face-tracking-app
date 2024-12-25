import 'package:camera/camera.dart';

class CameraService {
  static Future<CameraDescription> getFirstAvailableCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw CameraException('No cameras available', 'No cameras found');
    }
    return cameras.first;
  }

  static CameraController initializeController(CameraDescription camera) {
    return CameraController(
      camera,
      ResolutionPreset.high,
    );
  }
}
