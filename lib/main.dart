import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_app/config/config.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GetX mini apps',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}
