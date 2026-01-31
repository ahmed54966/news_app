import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/model/source_response.dart';
import 'package:news/news/news_widget.dart';
import 'package:news/tabs/TabItem.dart';
    
// ignore: must_be_immutable
class TabWidget extends StatefulWidget {


  List <Source> sourcesList ;
  TabWidget({required this.sourcesList });

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {
                
              });
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: widget.sourcesList.map((source) => TabItem(
              isSelected: selectedIndex ==widget.sourcesList.indexOf(source),
              source: source)).toList()
          ),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex],))
        ],
      ));
  }
}