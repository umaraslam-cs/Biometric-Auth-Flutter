import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Utils/custom_error.dart';
import 'View/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return widget!;
      },
      debugShowCheckedModeBanner: false,
      title: 'Biometric Authenntication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
