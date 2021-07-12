import 'package:flutter/material.dart';

Widget defaultButton({
  @required double? width,
  @required Color? background,
  @required VoidCallback? function,
  @required String? text,
  @required double? height,
})=>Container(
  color: background,
  width: width,
  height: height,
  child: MaterialButton(
    onPressed:function,
    child:
    Text(text!,
      style: TextStyle(color: Colors.white,fontSize: 20),),
  ),
);