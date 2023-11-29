import 'package:news_app/model/SourcesResponse.dart';

class ArticleResponse {
  ArticleResponse({
      this.status, 
      this.totalResults, 
      this.articles,});

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<Article>? articles;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['status'] = status;
  //   map['totalResults'] = totalResults;
  //   if (articles != null) {
  //     map['articles'] = articles?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    if (json['source'] != null) {
      source = Sources.fromJson(json['source']);
    }
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (source != null) {
  //     map['source'] = source?.toJson();
  //   }
  //   map['author'] = author;
  //   map['title'] = title;
  //   map['description'] = description;
  //   map['url'] = url;
  //   map['urlToImage'] = urlToImage;
  //   map['publishedAt'] = publishedAt;
  //   map['content'] = content;
  //   return map;
  // }

}


