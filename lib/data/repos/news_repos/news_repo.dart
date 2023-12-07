import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/model/SourcesResponse.dart';
import 'package:news_app/data/repos/news_repos/data_sources/offline_data_source.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';

class NewsRepo{
  OfflineDataSource offlineDataSource;
  OnlineDataSource onlineDataSource;
  NewsRepo(this.onlineDataSource,this.offlineDataSource);

  Future<SourcesResponse?> getSources(String categoryId) async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile){
      SourcesResponse response = await onlineDataSource.getSources(categoryId);
      offlineDataSource.saveSources(response,categoryId);
      return response;
    }else{
     return await offlineDataSource.getSources(categoryId);
    }
  }
}