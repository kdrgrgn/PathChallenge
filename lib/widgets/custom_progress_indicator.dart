import 'package:challenge/AppBase/app_base.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(valueColor:   AlwaysStoppedAnimation<Color>(AppBase.redColor ,
    ),
      )
    );
  }
}
