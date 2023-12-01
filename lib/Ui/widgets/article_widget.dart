import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/ArticleResponse.dart';

class ArticleWidget extends StatelessWidget{
  final Article article;
  const ArticleWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(imageUrl: article.urlToImage!,
            placeholder:(_,__)=> Center(child: CircularProgressIndicator()),
            errorWidget: (_,__,___)=>Icon(Icons.error),
            height:MediaQuery.of(context).size.height*.25,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 6,),
          Text(article.source?.name??"",style: TextStyle(color: Colors.black),),
          SizedBox(height: 6,),
          Text(article.title??""),
          SizedBox(height: 6,),
          Text(article.publishedAt??"",textAlign: TextAlign.end,),

        ],
      ),
    );
  }
}
