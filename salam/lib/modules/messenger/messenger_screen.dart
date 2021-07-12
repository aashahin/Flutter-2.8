import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 10,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://res.cloudinary.com/mrshahin/image/upload/v1625664095/AvatarMaker_ijzvg6.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text('Chats',
            style: TextStyle(
              color:Colors.black,
            ),
            )
          ],
        ),
        actions: [
          IconButton(
              iconSize: 30,
              onPressed: (){},
              icon: CircleAvatar(radius:15,backgroundColor: Colors.blue,child: Icon(Icons.camera_alt,size: 20,color: Colors.white,))),
          IconButton(
              iconSize: 30,
              onPressed: (){},
              icon: CircleAvatar(radius:15,backgroundColor: Colors.blue,child: Icon(Icons.edit,size: 20,color: Colors.white,))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[400],
                ),
                padding:EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15,),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection:Axis.horizontal ,
                  itemBuilder: ( context,index )=>buildStoryItem(),
                  separatorBuilder:(context,index)=> SizedBox(
                    width: 20,
                  ),
                  itemCount: 10,
    ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index)=>buildChatitem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20,),
                  itemCount: 30)
            ],
          ),
        ),
      )
    );
  }

  Widget buildChatitem()=> Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://res.cloudinary.com/mrshahin/image/upload/v1625664095/AvatarMaker_ijzvg6.png'),
          ),
          CircleAvatar(radius: 8,backgroundColor: Colors.white,),
          CircleAvatar(radius: 7,backgroundColor: Colors.red,),
        ],
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Abdelrahman Shaheen',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('Hello My Name Is Abdelrahman Shaheen',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('04:28 pm'),
              ],
            )

          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem()=>Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://res.cloudinary.com/mrshahin/image/upload/v1625664095/AvatarMaker_ijzvg6.png'),
            ),
            CircleAvatar(radius: 8,backgroundColor: Colors.white,),
            CircleAvatar(radius: 7,backgroundColor: Colors.red,),
          ],
        ),
        SizedBox(height:5,),
        Text('Abdelrahman Shaheen',
          maxLines: 2,  // حد عدم تخطي النص  أكثر من سطرين
          overflow: TextOverflow.ellipsis, // جعل النص الزائد علي شكل نقاط
        ),
      ],
    ),
  );
}
