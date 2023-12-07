import 'package:flutter/cupertino.dart';
import 'package:news_app/data/repos/news_repos/data_sources/offline_data_source.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';
import 'package:news_app/data/model/SourcesResponse.dart';
import 'package:news_app/data/repos/news_repos/news_repo.dart';

class NewsTabViewModel extends ChangeNotifier{
  List<Sources>sources=[];
  bool isLoading = false;
  String? errorText;
  NewsRepo newsrepo =  NewsRepo(OnlineDataSource(),OfflineDataSource());
  void getSources(String categoryId) async{
    isLoading = true;
    notifyListeners();
    try{
      SourcesResponse? sourcesResponse = await newsrepo.getSources(categoryId);
      if(sourcesResponse != null  && sourcesResponse.sources?.isNotEmpty == true) {
        isLoading = false;
        sources = sourcesResponse.sources!;
        notifyListeners();
      }else{
        throw "Some thing went wrong";
      }
    }catch(error)   {
      isLoading = false;
      errorText = error.toString();
      notifyListeners();

    }
  }
}