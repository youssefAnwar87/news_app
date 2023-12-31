import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/data/model/ArticleResponse.dart';
import 'package:news_app/data/model/SourcesResponse.dart';


 class OnlineDataSource {
  static const String baseUrl ='newsapi.org';
  static const String apiKey = "625bf1c648ec406385cbd8af82f7c8a7";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https(baseUrl,sourceEndPoint ,{"apiKey" : apiKey,
    "category" : category
    });
    Response response = await get(url);
    // print(url);
    Map json = jsonDecode(response.body) as Map;
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if(response.statusCode >= 200 && response.statusCode < 300 && sourcesResponse.sources?.isNotEmpty == true){
      return sourcesResponse!;
    }else{
      throw Exception(sourcesResponse.message);
    }
  }
   Future<List<Article>>getArticles( String sourceId) async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      "apiKey" : apiKey,
      "sources" : sourceId
    });
    var serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticleResponse articleResponse = ArticleResponse.fromJson(json);
    if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300
        && articleResponse.articles?.isNotEmpty == true){
      return articleResponse.articles!;
    }else{
      throw Exception("Something went wrong please try again later!");
    }
  }
}