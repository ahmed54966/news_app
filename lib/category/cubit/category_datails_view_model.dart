
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/category/cubit/sources_state.dart';
import 'package:news/model/api_manager.dart';
import 'package:news/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:news/repository/sources/repositary/source_repositary_impl.dart';
import 'package:news/repository/sources/source_data_source_contract.dart';
import 'package:news/repository/sources/source_repositary_contract.dart';

class CategoryDatailsViewModel extends Cubit<SourcesState> {
  late SourceRepositaryContract repositaryContract ;
  late ApiManager apiManager;
  late SourceRemoteDataSourceContract remoteDataSourceContract;

  CategoryDatailsViewModel() : super (SourceLoadingState()){
  apiManager = ApiManager();
  remoteDataSourceContract = SourceRemoteDataSourceImpl(
    apiManager: apiManager);
  repositaryContract = SourceRepositaryImpl(
    remoteDataSourceContract: remoteDataSourceContract);
  }

  void getSources(String categoryId)async{
    try{

      emit(SourceLoadingState());

      var response = await repositaryContract.getSources(categoryId);
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