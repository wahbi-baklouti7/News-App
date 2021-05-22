import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_state.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchWord,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      labelText: "search",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1))),
                  onChanged: (text) {
                    // print(searchWord.text);
                    searchWord.text += text;
                    AppCubit.get(context).searchData(searchWord.text);
                    print(searchWord.text
                    );
                  },
                ),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}
