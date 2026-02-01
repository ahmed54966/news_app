import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/model/category.dart';
import 'package:news/model/source_response.dart';
import 'package:news/tabs/TabWidget.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {

  Categories category ;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return/////api 
          FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(widget.category.id),
            builder: (context , snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));

              }else if (snapshot.hasError){
                return Column(
                  children: [
                    Text("something_went_wrong".tr()),
                    ElevatedButton(onPressed: (){
                      ApiManager.getSources(widget.category.id);
                      setState(() {
                        
                      });
                    }, child: Text("try_again".tr()))
                  ],
                );
              }

              if(snapshot.data!.status != "ok"){
                return Column(
                  children: [
                    Text(snapshot.data!.message!),
                    ElevatedButton(onPressed: (){}, child: Text("try_again".tr()))
                  ],
                );
              }
              var sourceList = snapshot.data!.sources!;
              return TabWidget(sourcesList: sourceList, );

            }
            );
  }
}