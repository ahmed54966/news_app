import 'package:news/model/source_response.dart';

abstract class SourceRepositaryContract {
  Future<SourceResponse?> getSources(String categoryId);
}