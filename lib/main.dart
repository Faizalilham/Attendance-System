
import 'package:attendance_system/app/modules/detections/views/components/camera_screen.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id_ID', null);
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(
    GetMaterialApp(
      title: "Attendance System",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
    ),
  );
}
