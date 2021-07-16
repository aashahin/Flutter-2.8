import 'package:flutter/material.dart';
import 'package:salam/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:salam/modules/done_tasks/done_tasks_screen.dart';
import 'package:salam/modules/new_tasks/new_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0; // التحكم في كرنت اندكس من خلال انشاء متغيير ووضعه في قيمة كرنت اندكس
  List<Widget> screens = [ // محتوي كل صفحة
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [ // عنوان كل صفحة والتنقل بينهم
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];

  @override
  void initState() {
    // TODO : DATABASE SQFLITE
    super.initState();
    createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]), // تغيير العنوان حسب رقم كل زر من خلال كرنت اندكس
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () async // نضع اسينك في حالة كان العنصر سيعمل في الخلفية ولا نضعها في الخاصية الثانية
        {
          // try{
          //   var name = await getname(); // اويت أي انتظر في حالة كان يستلم بيانات فنعطيه هذه القيمة
          //   print(name);
          //   throw ('انشاء خطأ');
          // } catch(error){ // رسالة الخطأ
          //   print('error ${error.toString()}');
          // }
getname().then((value) {
  var name = value;
  print(name);
  print('osama');
  // الفرق بين الأول والثاني أن الأول قد تظهر النتيجية الثانيه في حال تاخرت الاولي بخللاف هذه تعرض كل في ترتيبه حتي وان تاخرت
}
).catchError((error){ // رسالة خطأ في حال فشل التنفيذ
  print('error ${error.toString()}');
}
);
        },
        child: Icon(Icons.add),
        hoverColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: currentIndex,
        onTap: (index){ 
          setState(() {
            currentIndex = index; // الانتقال من خيار لأخر
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),

        ],
      ),
    );
  }
  Future<String> getname() async //فيوتشر : عنصر يعمل في الخلفية خاص بقاعدة البيانات وارسالها
  {
    return 'Ahmed';
  }
  void createDatabase() async
  {
    var database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate:(database,version){
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database){
        print('database opened');

      }
    );
  }
  void insertToDatabase(){
  }
}
