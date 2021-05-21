import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_state.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/layouts/home_screen.dart';
import 'package:news_app/shared/network/locale/cacher_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBool(key: "isDark");
  runApp(NewsApp(isDark));

}


class NewsApp extends StatelessWidget {
  final bool isDark;
  NewsApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness()..changeMode(
        fromShared: isDark
      ),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.red,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    actionsIconTheme:
                        IconThemeData(size: 35, color: Colors.black),
                    titleTextStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    backgroundColor: Colors.white,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      // statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    elevation: 0.4,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.red[600],
                    backgroundColor: Colors.grey[100],
                    unselectedItemColor: Colors.black,
                    elevation: 1.5,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                  ),
                  textTheme: TextTheme(
                      subtitle1: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black87,
                  primarySwatch: Colors.red,
                  appBarTheme: AppBarTheme(
                    actionsIconTheme:
                        IconThemeData(size: 35, color: Colors.white),
                    titleTextStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    backgroundColor: Colors.black87,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black87,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    elevation: 2,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.grey[400],
                    backgroundColor: Colors.grey[900],
                    selectedItemColor: Colors.red[600],
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                  ),
                  textTheme: TextTheme(
                      subtitle1: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: HomeScreen());
        },
      ),
    );
  }
}
