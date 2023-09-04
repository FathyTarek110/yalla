import 'package:flutter/material.dart';
import 'package:yalla_go/home/presntation/screens/about_us/about_us.dart';
import 'package:yalla_go/home/presntation/screens/home_screen/home_screen.dart';


class Routes{
static const String mainLayout = '/';

static const String aboutUs ='/about_us' ;
}

class RouteGenerator{

  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_)=>  const HomeScreen());
      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_)=>  const AboutUs());
    }
    return MaterialPageRoute(builder: (_)=> const Scaffold(
      body: Center(child: Text('error occurred  please restart the app'),),

    ));
  }

}