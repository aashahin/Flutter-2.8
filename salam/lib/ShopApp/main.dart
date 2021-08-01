import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salam/layout/news_app/cubit/cubit.dart';
import 'package:salam/modules/ShopApp/on_boarding/on_boarding_screen.dart';
import 'package:salam/shared/bloc_observer.dart';
import 'package:salam/shared/cubit/cubit.dart';
import 'package:salam/shared/cubit/states.dart';
import 'package:salam/shared/network/local/cache_helper.dart';
import 'package:salam/shared/network/remote/dio_helper.dart';
import 'package:salam/shared/styles/ShopApp/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // يعمل علي تشغيل عمليات await اولا
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness(),),
        BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark))
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: OnBoardingScreen());
        },
      ),
    );
  }
}
