import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/api_constants.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';
class ApiManager {

///https://newsapi.org/v2/top-headlines/sources?apiKey=4ff4c2e368e041f9992adb7aeaaf0307
  Future <SourceResponse?> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,{
      "apiKey" : ApiConstants.apiKey,
      "category" :categoryId
    });
    var response = await http.get(url);
    try{
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourceResponse.fromJson(json);
    }catch(e){
      rethrow;

    }

  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=4ff4c2e368e041f9992adb7aeaaf0307
  Future<Newsresponse?> getNewsBySourceId(String sourceId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      "apiKey" : ApiConstants.apiKey,
      "sources" : sourceId
    });
    var response = await http.get(url);
    try{
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return Newsresponse.fromJson(json);
    }catch(e){
      rethrow;

    }
  }
}