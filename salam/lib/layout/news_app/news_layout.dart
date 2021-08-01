import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salam/layout/news_app/cubit/cubit.dart';
import 'package:salam/layout/news_app/cubit/states.dart';
import 'package:salam/modules/NewsApp/search/search.dart';
import 'package:salam/shared/components/components.dart';
import 'package:salam/shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Bird News'),
            actions: [
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    size: 30,)),
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search,size: 30,)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){ // التنقل بين الصفحات من خلال معرف الكرنت اندكس
             cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ) ,
        );
      }
    );
  }
}
