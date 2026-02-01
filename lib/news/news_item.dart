import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/news_response.dart';

// ignore: must_be_immutable
class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: CachedNetworkImage(
      imageUrl: news.urlToImage??"",
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
      fit: BoxFit.fill,
      placeholder: (context, url) => Center(child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        ),
        Text(news.author??"",
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.grayColor
        )),
        SizedBox(height: 10,),

        Text(news.title??"",
        style: Theme.of(context).textTheme.titleMedium
        ),
        SizedBox(height: 10,),

        Text(news.publishedAt??"",
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.grayColor
        )),
        SizedBox(height: 10,),
      ],
    );
  }
}