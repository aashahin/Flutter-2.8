import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required String? text,
  required VoidCallback function,
  double height = 45,
  bool isUppercase = true,
  double radius = 5,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius:BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(onPressed: function,
    child: Text(
      isUppercase ? text!.toUpperCase() : text!,
      style: TextStyle(color: Colors.white,fontSize: 18),),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? validate,
  required dynamic label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  VoidCallback? onTap,
  Color colorField = Colors.black54,
bool isClickable = true,
}) =>
    TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      validator: (value){
        return validate!(value);
      },
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorField)
        ),
        prefixIcon: Icon(prefix,color: colorField,),
        suffixIcon: IconButton(
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(suffix),
        ),
      ),

    );
