import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/Ui/widgets/ErrorView.dart';
import 'package:news_app/Ui/widgets/article_widget.dart';
import 'package:news_app/Ui/widgets/loading_widget.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';
import 'package:news_app/data/model/ArticleResponse.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList({super.key,required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OnlineDataSource().getArticles(sourceId),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return buildArticleListView(snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorView(message: snapshot.error.toString());
          }
          else{
            return LoadingWidegt();
          }
        }
    );
  }

   buildArticleListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
        itemBuilder: (context,index){

         return ArticleWidget(article: articles[index],);
        });
   }
}
