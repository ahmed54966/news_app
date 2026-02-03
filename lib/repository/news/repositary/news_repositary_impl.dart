import 'package:news/model/news_response.dart';
import 'package:news/repository/news/news_data_source_contract.dart';
import 'package:news/repository/news/news_repositary_contract.dart';


class NewsRepositaryImpl implements NewsRepositaryContract {
  NewsRemoteDataSourceContract remoteDataSourceContract;
  NewsRepositaryImpl({required this.remoteDataSourceContract});
  @override
  Future<Newsresponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSourceContract.getNewsBySourceId(sourceId);
  }
}