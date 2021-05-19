import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_state.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sport_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigator = [
    BottomNavigationBarItem(
        label: "Business", icon: Icon(Icons.business_center_rounded)),
    BottomNavigationBarItem(
        label: "Science", icon: Icon(Icons.science_rounded)),
    BottomNavigationBarItem(
        label: "Sport", icon: Icon(Icons.sports_soccer_rounded)),
  ];

  List<Widget> screens = [BusinessScreen(), ScienceScreen(), SportScreen()];

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sport = [];

  // Get the current index of bottom navigator when tapping
  void getBottomNavIndex(int index) {
    if (index == 1) {
      getScience();
    } else if (index == 2) {
      getSport();
    }
    currentIndex = index;
    emit(BottomNavScreens());
  }

  // Retrieve business data
  void getBusiness() {
    emit(NewsBusinessLoadingState());

    DioHelper.getData(urlMethod: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "f2526056031b431d853ae5d7b0259c4e"
    }).then((value) {
      business = value.data["articles"];
      emit(NewsBusinessStateSuccess());
    }).catchError((error) {
      emit(NewsBusinessStateError(error: error.toString()));
    });
  }

  // Retrieve science data
  void getScience() {
    
    if (science.length == 0) {
      emit(NewsScienceLoadingState());
      DioHelper.getData(urlMethod: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "f2526056031b431d853ae5d7b0259c4e"
      }).then((value) {
        science = value.data["articles"];
        emit(NewsScienceStateSuccess());
      }).catchError((error) {
        emit(NewsScienceStateError(error: error.toString()));
      });
    } else {
      emit(NewsScienceStateSuccess());
    }
  }

  // Retrieve sport data
  void getSport() {
    
    if (sport.length == 0) {
      emit(NewsSportLoadingState());
      DioHelper.getData(urlMethod: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "f2526056031b431d853ae5d7b0259c4e"
      }).then((value) {
        sport = value.data["articles"];
        emit(NewsSportStateSuccess());
      }).catchError((error) {
        emit(NewsSportStateError(error: error.toString()));
      });
    } else {
      emit(NewsSportStateSuccess());
    }
  }
}
