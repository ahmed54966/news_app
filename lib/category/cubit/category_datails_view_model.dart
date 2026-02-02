
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/category/cubit/sources_state.dart';
import 'package:news/model/api_manager.dart';

class CategoryDatailsViewModel extends Cubit<SourcesState> {
  CategoryDatailsViewModel() : super (SourceLoadingState());

  void getSources(String categoryId)async{
    try{

      emit(SourceLoadingState());

      var response = await ApiManager.getSources(categoryId);
      if(response?.status == 'error'){
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if(response?.status == 'ok'){
        emit(SourceSuccessState(sourceList: response!.sources!));
        return;
      }


      }

    catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
    
  }


}