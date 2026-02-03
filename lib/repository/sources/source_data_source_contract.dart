import 'package:news/model/source_response.dart';

abstract class SourceRemoteDataSourceContract {
  Future<SourceResponse?> getSources(String categoryId);
}
