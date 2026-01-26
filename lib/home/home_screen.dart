import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("news_app".tr(),
            style: Theme.of(context).textTheme.titleLarge,),
          ),
        )


      ],
    );
  }
}