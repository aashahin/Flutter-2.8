import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:intl/intl.dart';
import 'package:salam/shared/components/components.dart';
import 'package:salam/shared/cubit/cubit.dart';
import 'package:salam/shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var backgroundFloatBottom = Colors.deepPurpleAccent;
  String toolTip = 'Add';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      AppCubit()
        ..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              backgroundColor: Colors.deepPurpleAccent,
              elevation: 5,
              shadowColor: Colors.black,
              automaticallyImplyLeading: true,
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (
                  context) => state is! AppGetDatabaseLoadingState,
              widgetBuilder: (context) => cubit.screens[cubit.currentIndex],
              fallbackBuilder: (context) =>
                  Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,)),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: backgroundFloatBottom,
              tooltip: 'Add',
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                  }
                } else {
                  scaffoldKey.currentState!.showBottomSheet((context) =>
                      Container(
                        // color: Colors.white,
                        padding: EdgeInsets.all(20),
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
                                  validate: (String value) {
                                    if (value.isEmpty) {
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
                                      timeController.text =
                                          value.format(context);
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
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
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  }),
                            ],
                          ),
                        ),
                      ),
                    elevation: 20,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                  backgroundFloatBottom = Colors.deepPurpleAccent;
                }
              },
              child: Icon(cubit.febIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepPurpleAccent,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
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
        },
      ),
    );
  }
}
