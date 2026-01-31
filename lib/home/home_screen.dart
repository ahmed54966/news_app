import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/category/cattegory_fragment.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          body: CattegoryFragment()
          
        )


      ],
    );
  }
}