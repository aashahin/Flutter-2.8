import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salam/modules/BmiApp/bmi/result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 80;
  int age = 15;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text('BMI Calculator'),
        elevation: 5,
        shadowColor: Colors.red,
        centerTitle: true,
        backgroundColor: Colors.black,
      )),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isMale ? Colors.red : Colors.white10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/male-gender.png',width: 80,color:Colors.white),
                                SizedBox(height: 10,),
                                Text('Male',style: TextStyle(fontSize: 30,color:Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isMale ? Colors.white10 : Colors.red,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/female.png',width: 90,color:Colors.white), // تضمين صورة لكن يجب وضع مسارها في ملف بب سبيس
                                SizedBox(height: 10,),
                                Text('Famle',style: TextStyle(fontSize: 30,color:Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',style: TextStyle(fontSize: 30,color:Colors.white),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${height.round()}',style: TextStyle(fontSize: 40,color:Colors.white),),
                          Text('CM',style: TextStyle(fontSize: 20,color:Colors.white),),
                        ],
                      ),
                      Slider(
                          value: height,
                          min: 70,
                          max: 220,
                          inactiveColor: Colors.green,
                          activeColor: Colors.red,
                          onChanged:(value){
                            setState(() {
                              height = value;
                            });}
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white10
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Weight',style: TextStyle(fontSize: 20,color:Colors.white),),
                              Text('$weight',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color:Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight=40;
                                      });
                                    },
                                    heroTag: 'Weight-',
                                    mini: true,
                                    backgroundColor: Colors.red,
                                    hoverColor: Colors.redAccent,
                                    child: Icon(Icons.remove),),
                                  SizedBox(width: 5,),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    heroTag: 'Weight++',
                                    backgroundColor: Colors.red,
                                    hoverColor: Colors.redAccent,
                                    mini: true,
                                    child: Icon(Icons.add),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white10
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age',style: TextStyle(fontSize: 20,color:Colors.white),),
                              Text('$age',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color:Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        age=15;
                                      });
                                    },
                                    heroTag: 'age-',
                                    mini: true,
                                    backgroundColor: Colors.red,
                                    hoverColor: Colors.redAccent,
                                    child: Icon(Icons.remove),),
                                  SizedBox(width: 5,),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState((){
                                        age++;
                                      });
                                    },
                                    heroTag: 'age++', // وصف للزر حتي يفرقهم المترجم اذا كان هناك اكثر من زر
                                    mini: true,
                                    backgroundColor: Colors.red,
                                    hoverColor: Colors.redAccent,
                                    child: Icon(Icons.add),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
                width: double.infinity,
                color: Colors.deepPurpleAccent,
                child: MaterialButton(
                  onPressed: (){
                    double result = weight / pow(height / 100, 2);
                    print(result.round());
                    Navigator.push( // ارسال الي او الذهاب الي صفحة اخري / تنقل
                        context,
                        MaterialPageRoute( // المكان الذاهب إليه
                            builder: (context)=>BMIResultScreen( // نضع اوبجكت الصفحة المطلوب الإنتقال اليها
                              age: age..round(),
                              isMale: isMale,
                              result: result.round(),
                            )));
                  },
                  height: 60,child: Text('CALCULATE',style: TextStyle(color: Colors.white),),))
          ],
        ),
      ),
    );
  }
  }

