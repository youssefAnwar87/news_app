import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatelessWidget{
  static const String  routeName ="Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"),),
      body: NewsTab() ,
    );
  }
}
