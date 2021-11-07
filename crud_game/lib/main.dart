import 'package:crud_game/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Data Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homePage',
      getPages: routes(),
    );
  }
}