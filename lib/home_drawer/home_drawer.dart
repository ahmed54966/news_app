import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*0.1
            ),
            child: Text("news_app".tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onSideMenuItemClick(categories);
              },
              
              child: Row(
                children: [
                  Icon(Icons.list,size: 30,),
                  SizedBox(width: 5,),
                  Text("categories".tr(),
                  style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onSideMenuItemClick(settings);
              },

              child: Row(
                children: [
                  Icon(Icons.settings,size: 30,),
                  SizedBox(width: 5,),
                  Text("settings".tr(),
                  style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}