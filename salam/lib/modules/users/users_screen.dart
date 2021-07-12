import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salam/models/user/user_model.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users = [ //
    UserModel(id: 1, name: 'Abdelrahman Shaheen', phone: '01557882411'),
    UserModel(id: 2, name: 'Ahmed Adel', phone: '011548916556'),
    UserModel(id: 3, name: 'Mohammed Ali', phone: '01540814132'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text(
          'Salam',
        ),
      )),
      body:ListView.separated(
      itemBuilder: (context,index)=>usersItem(users[index]), // اسدعاء قاعدة البيانات
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(3.0),
      ),
      itemCount: users.length, // علي طول القاعدة حتي يقرأ القاعدة بالكامل
      )
    );
  }

  Widget usersItem(UserModel user) // استدعاء جدول القاعدة وتسميته باسم يوزر
  =>Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text(
            '${user.id}', // استدعاء صف من قاعدة البيانات
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('${user.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 5,),
            Text('${user.phone}',style: TextStyle(fontSize: 15),)
          ],
        )

      ],
    ),
  );
}
