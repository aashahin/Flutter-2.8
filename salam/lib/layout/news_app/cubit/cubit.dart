import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salam/layout/news_app/cubit/states.dart';
import 'package:salam/modules/NewsApp/business/business_screen.dart';
import 'package:salam/modules/NewsApp/science/science_screen.dart';
import 'package:salam/modules/NewsApp/sports/sports_screen.dart';
import 'package:salam/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball_outlined),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];
  int currentIndex = 0; // معرف الصفحات يبدأ من صفر
  void changeBottomNavBar(index) {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState()); // حتي يعيد البناء والانتقال مثل StateFul
  }
// Apis Category
  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if(business.length == 0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '785e4ec47a154938a548bb40fbf42d78',
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }

  }
  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetScienceLoadingState());
    if(sports.length == 0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '785e4ec47a154938a548bb40fbf42d78',
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if(science.length == 0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '785e4ec47a154938a548bb40fbf42d78',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '785e4ec47a154938a548bb40fbf42d78',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

}
