import 'package:hive/hive.dart';
import 'package:news_app/data/model/SourcesResponse.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';

class OfflineDataSource{
 Future<SourcesResponse?> getSources(String category) async{
   var box = await Hive.openBox('tabs');
   Map? json =  box.get(category);
   if(json == null ) return null;
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;
 }
  saveSources(SourcesResponse sourcesResponse,String category) async{
    var box = await Hive.openBox('tabs');
    await box.put(category, sourcesResponse.toJson());
    box.close();

 }
}