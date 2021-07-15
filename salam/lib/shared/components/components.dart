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
  // Function? onSubmit,
  // Function? onChange,
  bool isPassword = false,
  Function? suffixPressed,
}) =>
    TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      // onFieldSubmitted: (get){
      //   onSubmit!(get);
      // },
      // onChanged: (test){
      //   onChange!(test);
      // },
      validator: (value){
        return validate!(value);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            onPressed: (){
              suffixPressed!();
            },
            icon: Icon(suffix)),
      ),

    );
