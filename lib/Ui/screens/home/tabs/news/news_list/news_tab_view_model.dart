import 'package:flutter/cupertino.dart';
import 'package:news_app/data/api/api_manger.dart';
import 'package:news_app/model/SourcesResponse.dart';

class NewsTabViewModel extends ChangeNotifier{
  List<Sources>sources=[];
  bool isLoading = false;
  String? errorText;
  void getSources(String categoryId) async{
    isLoading = true;
    notifyListeners();
    try{
      sources = await ApiManger.getSources(categoryId);
      isLoading = false;
      notifyListeners();

    }catch(error)   {
      isLoading = false;
      errorText = error.toString();
      notifyListeners();

    }
  }
}