import 'package:flutter/material.dart';
import 'package:salam/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:salam/modules/done_tasks/done_tasks_screen.dart';
import 'package:salam/modules/new_tasks/new_tasks_screen.dart';

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
        onPressed: (){},
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
}
