import 'package:news/model/news_response.dart';


abstract class NewsRepositaryContract {
  Future<Newsresponse?> getNewsBySourceId(String sourceId);
}