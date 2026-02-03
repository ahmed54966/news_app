import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/news/cubit/news_state.dart';
import 'package:news/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:news/repository/news/news_data_source_contract.dart';
import 'package:news/repository/news/news_repositary_contract.dart';
import 'package:news/repository/news/repositary/news_repositary_impl.dart';

class NewsWidgetViewModel extends Cubit<NewsState>{
  late NewsRepositaryContract repositaryContract ;
  late ApiManager apiManager;
  late NewsRemoteDataSourceContract remoteDataSourceContract;
  NewsWidgetViewModel() : super (NewsLoadingState()){
    apiManager = ApiManager();
  remoteDataSourceContract = NewsRemoteDataSourceImpl(
    apiManager: apiManager);
  repositaryContract = NewsRepositaryImpl(
    remoteDataSourceContract: remoteDataSourceContract);

  }

  void getNewsBySourceId(String sourceId)async{
    try{

      emit(NewsLoadingState());

      var response = await repositaryContract.getNewsBySourceId(sourceId);
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