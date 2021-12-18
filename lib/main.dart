import 'package:challenge/AppBase/app_base.dart';
import 'package:challenge/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(


        debugShowCheckedModeBanner: false,


        theme: ThemeData(
          scaffoldBackgroundColor:AppBase.appColor ,
          appBarTheme: AppBarTheme(
          backgroundColor:  AppBase.appColor,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle:const TextStyle(
              backgroundColor: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ) ,
          ),

          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),


        ),
        home:const  HomePage(),


    );
  }
}





