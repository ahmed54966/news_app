import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/category/category_item.dart';
import 'package:news/model/category.dart';

class CattegoryFragment extends StatelessWidget {
  var categoriesList = Categories.getCategory();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pick your category of interest".tr(),
          style: Theme.of(context).textTheme.titleMedium,),

          SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2,
              mainAxisSpacing:10 ,
              crossAxisSpacing: 10),
              itemBuilder: (context , index){
                return CategoryItem(category: categoriesList[index], index: index);
              },
              itemCount:categoriesList.length ,),
          )


        ],
      ),
    );
  }
}