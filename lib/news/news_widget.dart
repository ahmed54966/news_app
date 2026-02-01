import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/model/category.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';
import 'package:news/news/news_item.dart';

// ignore: must_be_immutable
class NewsWidget extends StatefulWidget {
  
  Source source;
  NewsWidget({super.key, required this.source });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Newsresponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id??""),
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
                      ApiManager.getNewsBySourceId(widget.source.id??"");
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
              var newsList = snapshot.data!.articles!;
              return ListView.builder(itemBuilder: (context , index){
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,
              );

            }
    );
      }
}
