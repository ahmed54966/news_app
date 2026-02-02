import 'package:news/model/source_response.dart';

abstract class SourcesState {}
class SourceInitialState extends SourcesState {}
class SourceLoadingState extends SourcesState {}
class SourceErrorState extends SourcesState{
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourcesState {
  List<Source> sourceList;
  SourceSuccessState({required this.sourceList});
}
