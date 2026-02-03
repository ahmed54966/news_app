import 'package:news/model/source_response.dart';
import 'package:news/repository/sources/source_data_source_contract.dart';
import 'package:news/repository/sources/source_repositary_contract.dart';

class SourceRepositaryImpl implements SourceRepositaryContract {
  SourceRemoteDataSourceContract remoteDataSourceContract;
  SourceRepositaryImpl({required this.remoteDataSourceContract});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSourceContract.getSources(categoryId);
  }
}