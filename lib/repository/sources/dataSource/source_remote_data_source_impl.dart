
import 'package:news/model/api_manager.dart';
import 'package:news/model/source_response.dart';
import 'package:news/repository/sources/source_data_source_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSourceContract {
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}