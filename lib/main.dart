import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Ui/screens/home/home_screen.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';
import 'package:path_provider/path_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
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
      },
      initialRoute: HomeScreen.routeName,
    );
  }

}

