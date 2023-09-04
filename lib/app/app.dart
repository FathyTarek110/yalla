import 'package:flutter/material.dart';
import 'package:yalla_go/core/resources/routes_manager.dart';
import 'package:yalla_go/core/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.mainLayout,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: myTheme(context),
    );
  }
}
