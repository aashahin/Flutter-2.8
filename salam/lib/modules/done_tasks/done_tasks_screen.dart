import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salam/shared/components/components.dart';
import 'package:salam/shared/cubit/cubit.dart';
import 'package:salam/shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) {
          var tasks = AppCubit.get(context).doneTasks;
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => tasks.length > 0,
            widgetBuilder: (context) =>  ListView.separated(
              itemBuilder: (context,index) =>buildTaskItem(tasks[index],context,iconShow: false),
              separatorBuilder: (context,index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              itemCount: tasks.length,
            ),
            fallbackBuilder:(context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/done.png'),
                  // SizedBox(height: 15,),
                  Text('There are no completed tasks',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),)
                ],
              ),
            ),
          );
        },
        listener: (context, state){});
  }
}
