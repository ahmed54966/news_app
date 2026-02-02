import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app_colors.dart';
import 'package:news/category/cubit/category_datails_view_model.dart';
import 'package:news/category/cubit/sources_state.dart';
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

  CategoryDatailsViewModel viewModel = CategoryDatailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDatailsViewModel,SourcesState>(
      bloc: viewModel,
      builder: (context , state){

        if(state is SourceLoadingState){
          return Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
        }else if (state is SourceErrorState){
          return Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: (){
                      ApiManager.getSources(widget.category.id);
                      setState(() {
                        
                      });
                    }, child: Text("try_again".tr()))
                  ],
                );
        }else if (state is SourceSuccessState){
          return TabWidget(sourcesList: state.sourceList);
        }
        return Container();


      }
      );
    


  }
}