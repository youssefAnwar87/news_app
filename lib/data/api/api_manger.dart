import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/SourcesResponse.dart';

abstract class ApiManger {
  static const String baseUrl ='newsapi.org';
  static const String apiKey = "625bf1c648ec406385cbd8af82f7c8a7";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static Future<List<Sources>> getSources() async {
    Uri url = Uri.https(baseUrl,sourceEndPoint ,{"apiKey" : apiKey});
    Response response = await get(url);
    // print(url);
    Map json = jsonDecode(response.body) as Map;
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if(response.statusCode >= 200 && response.statusCode < 300 && sourcesResponse.sources?.isNotEmpty == null){
      return sourcesResponse.sources!;
    }else{
      throw Exception(sourcesResponse.message);
    }
  }
  static getArticles(){}
}