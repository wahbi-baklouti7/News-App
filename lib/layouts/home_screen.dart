import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_state.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            title: Text("News App"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Icon(Icons.brightness_6),
                  onTap: () {
                    print("taping");
                    cubit.changeMode();
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavigator,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.getBottomNavIndex(index);
            },
          ),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }
}
