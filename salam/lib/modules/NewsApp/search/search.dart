import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salam/layout/news_app/cubit/cubit.dart';
import 'package:salam/layout/news_app/cubit/states.dart';
import 'package:salam/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            leading: IconButton(
              iconSize: 30,
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.centerRight,
              icon: Icon(Icons.close),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultFormField(
                    controller: searchController,
                    label: 'Search',
                    style: Theme.of(context).textTheme.bodyText1,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    prefix: Icons.search,
                    colorField: Theme.of(context).primaryColor,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Search must not be empty';
                      }
                    }
                ),
              ),
              Expanded(child: articlesBuild(list, context, isSearch: true))
            ],
          ),
        );
      } ,
    );
  }
}
