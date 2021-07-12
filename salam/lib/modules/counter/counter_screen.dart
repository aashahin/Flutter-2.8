import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget { // نستخدم هذه الحالة في العناصر التفاعلية التي تتغيير
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int Counter = 1;
@override
  void initState() { // حتي تعمل Stateful
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() { // عنصر اعادة بناء حتي يتم تغيير النشاط المحدث في العنصر في حالة تفاعل المستخدم معه
                Counter--;
                print(Counter);
              });

            }, child: Text('MINUS')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('$Counter',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900),),
            ),
            TextButton(onPressed: (){
             setState(() { // عنصر اعادة بناء حتي يتم تغيير النشاط المحدث في العنصر في حالة تفاعل المستخدم معه
               Counter++;
               print(Counter);
             });
            }, child: Text('PLUS')),

          ],
        ),
      ),
    );
  }
}
