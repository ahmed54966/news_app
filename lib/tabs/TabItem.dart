import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/source_response.dart';
    
// ignore: must_be_immutable
class TabItem extends StatelessWidget {

  bool isSelected;
  Source source;
  TabItem({required this.isSelected , required this.source});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        )
      ),
      child: Text(source.name??"",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color:isSelected ? AppColors.whiteColor :AppColors.primaryColor
      ),),
    );
  }
}