import 'package:flutter/material.dart';
class BMIResultScreen extends StatelessWidget {
 @required final  int? result;
 @required final dynamic isMale;
 @required final int? age;
 BMIResultScreen({this.age,this.isMale,this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5,
        shadowColor: Colors.red,
        leading: IconButton( // نستخدم هذا ان اردنا تغيير ايقونة الرجوع الافتراضية لكن لن يعمل معنا الزر لهذا نعطيه قيمة بوب
          onPressed: (){
            Navigator.pop(context); // الرجوع الي الصفحة الرئيسية
          },
          icon: Icon(Icons.arrow_left_sharp),
          iconSize: 30,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gender :  ${isMale ? 'Male' : 'Female'}',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                SizedBox(height: 10,),
                Text('Result :  $result',style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 10,),
                Text('Age :  $age',style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
