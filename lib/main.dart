import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/getx/binding.dart';
import 'package:flutter_state_management/getx/routes.dart';
import 'package:flutter_state_management/views/screens/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: Home.screenName,
    );
  }
}
