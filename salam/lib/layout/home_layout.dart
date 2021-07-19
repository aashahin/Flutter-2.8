import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salam/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:salam/modules/done_tasks/done_tasks_screen.dart';
import 'package:salam/modules/new_tasks/new_tasks_screen.dart';
import 'package:salam/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  IconData febIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var backgroundFloatBottom = Colors.deepPurpleAccent;
  String toolTip = 'Add';
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO : DATABASE SQFLITE
    super.initState();
    createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundFloatBottom,
        tooltip:toolTip,
        onPressed: () {
          if(isBottomSheetShown){
            if(formKey.currentState!.validate()){
              insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              ).then((value) {
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  febIcon = Icons.edit;
                  toolTip = 'Add';
                });
              });

            }
          }else{
            scaffoldKey.currentState!.showBottomSheet((context) =>
                Container(
                  color: Colors.grey[50],
                  padding:  EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(controller: titleController,
                            type: TextInputType.text,
                            label: 'Task Title',
                            prefix: Icons.title,
                            colorField: Colors.deepPurpleAccent,
                            validate: (String value){
                              if(value.isEmpty){
                                return 'title must not be empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 10),
                        defaultFormField(controller: timeController,
                            type: TextInputType.datetime,
                            label: 'Task Time',
                            colorField: Colors.deepPurpleAccent,
                            prefix: Icons.watch_later_outlined,
                            onTap: () {
                              showTimePicker(context: context,
                                  initialTime: TimeOfDay.now()
                              ).then((dynamic value) {
                                timeController.text = value.format(context);
                              });
                            },
                            validate: (String value){
                              if(value.isEmpty){
                                return 'time must not be empty';
                              }
                              return null;
                            }),
                        SizedBox(height: 10),
                        defaultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            label: 'Task Date',
                            colorField: Colors.deepPurpleAccent,
                            prefix: Icons.calendar_today,
                            onTap: () {
                              showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2021-10-07'),
                              ).then((dynamic value) {
                                dateController.text = DateFormat.yMMMd().format(value);
                              });
                            },
                            validate: (String value){
                              if(value.isEmpty){
                                return 'date must not be empty';
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                )
            );
            isBottomSheetShown = true;
            setState(() {

              febIcon = Icons.close;
              backgroundFloatBottom = Colors.deepPurpleAccent;
              toolTip = 'Close';
            });
          }

        },
        child: Icon(febIcon),
        hoverColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
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
  Future<String> getname() async
  {
    return 'Ahmed';
  }
  void createDatabase() async {
    database = await openDatabase(
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
  Future insertToDatabase({
   required String title,
   required String time,
    required String date,
}) async{
   return await database.transaction((txn) async  {
      database.transaction((txn) async {
        txn.rawInsert('INSERT INTO tasks (title,date,time,status) VALUES("$title", "$time", "$date", "new")'
        ).then((value) {
          print('inserted successful!');
        }).catchError((error){
          print('error 404 ${error.toString()}');
        });
      });
      return null;
    });
  }
}
