import 'package:news/model/news_response.dart';


abstract class NewsRemoteDataSourceContract {
  Future<Newsresponse?> getNewsBySourceId(String sourceId);
}
