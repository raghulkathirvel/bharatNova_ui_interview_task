import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  final status = await Permission.notification.status;

  if (status.isDenied) {
    final result = await Permission.notification.request();

    if (result.isGranted) {
      print("Notification Permission Granted");
    } else if (result.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}