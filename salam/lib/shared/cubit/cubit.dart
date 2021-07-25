import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salam/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:salam/modules/done_tasks/done_tasks_screen.dart';
import 'package:salam/modules/new_tasks/new_tasks_screen.dart';
import 'package:salam/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit()  : super(AppInitialStates());
  static AppCubit get(context) =>BlocProvider.of(context);
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
  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  void createDatabase()  {
    openDatabase(
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
          getDateFromDatabase(database);
          print('database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }
   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async{
     await database.transaction((txn) async  {
      database.transaction((txn) async {
        txn.rawInsert('INSERT INTO tasks (title,date,time,status) VALUES("$title", "$date", "$time", "new")'
        ).then((value) {
          print('inserted successful!');
          emit(AppInsertDataBaseState());
          getDateFromDatabase(database);
        }).catchError((error){
          print('error 404 ${error.toString()}');
        });
      });
      return null;
    });
  }
  void getDateFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
         else archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }
  void updateData({
  required String status,
  required int id,
}) async{
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value) {
          getDateFromDatabase(database);
          emit(AppUpdateDataBaseState());
    });
  }
  void deleteData({
    required int id,
  }) async{
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDateFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }
  bool isBottomSheetShown = false;
  IconData febIcon = Icons.edit;
  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
}){
    isBottomSheetShown = isShow;
    febIcon = icon;
    emit(AppChangeBottomSheetState());
  }

}