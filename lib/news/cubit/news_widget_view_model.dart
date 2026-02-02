import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/news/cubit/news_state.dart';

class NewsWidgetViewModel extends Cubit<NewsState>{
  NewsWidgetViewModel() : super (NewsLoadingState());

  void getNewsBySourceId(String sourceId)async{
    try{

      emit(NewsLoadingState());

      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        emit(NewserrorState(errorMessage: response!.message!));
        return;
      }
      if(response?.status == 'ok'){
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }


      }

    catch(e){
      emit(NewserrorState(errorMessage: e.toString()));
    }
    
  }
}