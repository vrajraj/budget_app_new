import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import './home page.dart';
//import 'UI/Start.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      accentColor: Colors.amber,
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String,WidgetBuilder>{
      '/Start':(context)=>StartIntoApp(),
   //   '/ThirdPage':(context)=>IntoThird(),
    },
  ));
}