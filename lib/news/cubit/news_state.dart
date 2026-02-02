import 'package:news/model/news_response.dart';

abstract class NewsState {}
class NewsLoadingState extends NewsState{}
class NewserrorState extends NewsState{
  String errorMessage;
  NewserrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsState {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}
