
import 'package:news/model/api_manager.dart';
import 'package:news/model/news_response.dart';
import 'package:news/repository/news/news_data_source_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSourceContract {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Newsresponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}