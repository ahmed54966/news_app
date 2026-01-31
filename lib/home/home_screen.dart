import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/cattegory_fragment.dart';
import 'package:news/home_drawer/home_drawer.dart';
import 'package:news/model/category.dart';
import 'package:news/settings/settings_tab.dart';



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
            title: Text(selectedSideMenuItem == HomeDrawer.settings ?
            "settings".tr() :
            selectedCategory == null ? 
              "news_app".tr():selectedCategory!.id,
            style: Theme.of(context).textTheme.titleLarge,),
            iconTheme:  IconThemeData(color: AppColors.whiteColor),
          ),
          drawer: Drawer( 
            child: HomeDrawer(onSideMenuItemClick : onSideMenuItemClick ),
          ),
          body: selectedSideMenuItem == HomeDrawer.settings ?
            SettingsTab() :
          selectedCategory == null ?
          CattegoryFragment(onCategoryFragmentClick:onCategoryItemClick ,) :
          CategoryDetails(category: selectedCategory!,),
          
        )


      ],
    );
  }
  Categories? selectedCategory;
  void onCategoryItemClick (Categories newCategory){

    selectedCategory = newCategory ;
  setState(() {
    
  });
  }

  int selectedSideMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick (int onSideMenuItem){
    selectedSideMenuItem = onSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {
      
    });
  }
}