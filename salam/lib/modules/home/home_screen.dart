import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 240, 85, 33),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: (){print('menu');},),
          title: Text('Salam'),
          elevation: 10,
          actions: [
            IconButton(onPressed: (){print("Account");}, icon: Icon(Icons.account_circle)),
            IconButton(onPressed: (){print("Notifications");}, icon: Icon(Icons.notifications)),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30),
                  )//دود للعنصر من اتجاه محدد
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer, // حتي يقبل العنصر القيمة السابقة نعطيه هذه القيمة
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                        image: NetworkImage('https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/7e1f5132332153.56d29a1c3733e.jpg'),
                      fit: BoxFit.cover, // احتواء الصورة

                    ),
                    Container(
                      color: Colors.blue.withOpacity(.3),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        'Allah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );

  }
}