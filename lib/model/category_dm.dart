import 'dart:io';

import 'package:flutter/material.dart';

class CategoryDm{
  String id;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backgroundColor;

  CategoryDm({required this.imagePath,required this.title,required this.id,
    required this.backgroundColor,required this.isLeftSided});
  static List<CategoryDm>categories=[
    CategoryDm(imagePath: "assets/ball.png",
        title: "Sports", id: "sports",
        backgroundColor: Colors.red[900]!, isLeftSided: true),

    CategoryDm(imagePath: "assets/Politics.png",
        title: "Technology", id: "technology",
        backgroundColor: Colors.blue[900]!, isLeftSided: false),

    CategoryDm(imagePath: "assets/health.png",
        title: "Health", id: "health",
        backgroundColor: Colors.pink, isLeftSided: true),

    CategoryDm(imagePath: "assets/bussines.png",
        title: "Business", id: "business",
        backgroundColor: Colors.orange[900]!, isLeftSided: false),

    CategoryDm(imagePath: "assets/environment.png",
        title: "Entertainment", id: "entertainment",
        backgroundColor: Colors.lightBlue, isLeftSided: true),

    CategoryDm(imagePath: "assets/science.png",
        title: "Science", id: "science",
        backgroundColor: Colors.yellow[500]!, isLeftSided: false),

  ];
}