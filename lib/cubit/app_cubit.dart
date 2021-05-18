import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_state.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sport_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigator = [
    BottomNavigationBarItem(label: "Business",
      icon: Icon(Icons.business_center_rounded)),
    BottomNavigationBarItem(label: "Science",
      icon: Icon(Icons.science_rounded)),
    BottomNavigationBarItem(label:"Sport" ,
      icon: Icon(Icons.sports_soccer_rounded)),
  ];

  List<Widget> screens = [BusinessScreen(), SportScreen(), ScienceScreen()];

  void getBottomNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavScreens());
  }
}
