import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salam/shared/cubit/cubit.dart';

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
Widget buildTaskItem(Map model,context,{
  IconData? prefixDone= Icons.check_box_outlined,
  IconData? prefixArchived=Icons.archive_outlined,
  bool iconShow = true,
  bool iconArchived =true,
}) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          // backgroundImage:AssetImage('assets/tasks.png'),
          backgroundColor: Colors.deepPurpleAccent,
          child: Text('${model['time']}',style: GoogleFonts.cairo(textStyle: TextStyle(color: Colors.white)),),
        ),
        SizedBox(
          width: 10,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${model['title']}',
                style:GoogleFonts.cairo(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              SizedBox(height: 5,),
              Text('${model['date']}',
                style:GoogleFonts.mada( textStyle:TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,))
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,),
        if(iconShow == true)
        IconButton(
            onPressed: (){
              AppCubit.get(context).updateData(status: 'done', id: model['id']);
            },
            icon: Icon(prefixDone),
          color: Colors.green,
        ),
        if(iconArchived == true)IconButton(
            onPressed: (){
              AppCubit.get(context).updateData(status: 'archived', id: model['id']);
            },
            icon:Icon(prefixArchived),
        color:Colors.blueGrey,
        ),
      ],
    ),
  ),
  onDismissed: (direction){
AppCubit.get(context).deleteData(id: model['id']);
  }
);
// Widget tasksBuilder({
//   context,
//   required List<Map> tasks,
//   required String title,
//   required String image,
//   }) => Conditional.single(
//   context: context,
//   conditionBuilder: (context) => tasks.length > 0,
//   widgetBuilder: (context) =>  ListView.separated(
//     itemBuilder: (context,index) =>buildTaskItem(tasks[index],context),
//     separatorBuilder: (context,index) => Container(
//       width: double.infinity,
//       height: 1,
//       color: Colors.grey[300],
//     ),
//     itemCount: tasks.length,
//   ),
//   fallbackBuilder:(context) => Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(image),
//         Text(title,style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),)
//       ],
//     ),
//   ),
// );