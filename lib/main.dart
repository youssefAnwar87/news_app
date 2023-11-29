import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Ui/screens/home/home_screen.dart';
import 'package:news_app/Ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/data/api/api_manger.dart';
import 'package:news_app/model/SourcesResponse.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName :(_) => HomeScreen(),
        CategoriesTab.routeName :(_) => CategoriesTab(),
      },
      initialRoute: CategoriesTab.routeName,
    );
  }

}

