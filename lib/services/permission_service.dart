import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      print("Camera permission granted!");
    } else {
      print("Camera permission denied.");
    }
  }
}
