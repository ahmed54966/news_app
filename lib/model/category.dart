import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class Categories {
  String id ;
  String imagePath ;
  String title ;
  Color color ;
  Categories({required this.color , required this.id , required this.imagePath , required this.title});


  static List <Categories> getCategory (){
    return [
      Categories(color: AppColors.brownColor, id: "business", imagePath: "assets/images/bussines.png", title: "business"),
      Categories(color: AppColors.blueColor, id: "entertainment", imagePath: "assets/images/environment.png", title: "entertainment"),
      Categories(color: AppColors.darkBlueColor, id: "general", imagePath: "assets/images/Politics.png", title: "general"),
      Categories(color: AppColors.pinkColor, id: "health", imagePath: "assets/images/health.png", title: "health"),
      Categories(color: AppColors.yellowColor, id: "science", imagePath: "assets/images/science.png", title: "science"),
      Categories(color: AppColors.redColor, id: "sports", imagePath: "assets/images/sports.png", title: "sports")
    ];
  }
}
