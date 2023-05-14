import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/pages/login_page.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
