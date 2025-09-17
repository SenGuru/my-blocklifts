import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:blocklifts/classes/myapp.dart';
import 'package:blocklifts/functions/initialize_hive.dart';
import 'package:blocklifts/functions/initialize_notifications.dart';
import 'package:blocklifts/functions/check_first_open.dart';
import 'package:blocklifts/functions/initialize_service.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();

  int androidSdkVersion = 0;
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    androidSdkVersion = androidInfo.version.sdkInt ?? 0;
  }

  await initializeHive();
  await checkFirstOpen();
  initializeNotifications();

  runApp(MyApp(androidSdkVersion: androidSdkVersion));
}
