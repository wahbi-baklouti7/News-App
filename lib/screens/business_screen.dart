import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_state.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsBusinessLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        var list = AppCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }

  
}
