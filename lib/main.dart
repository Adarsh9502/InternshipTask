import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/controllers/controller.dart';
import 'package:grow_simplee/screens/riders_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(RiderController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: RidersList(),
    );
  }
}
