import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_app/model/category_dm.dart';

class HomeScreen extends StatefulWidget{
  static const String  routeName ="Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  late final CategoriesTab categoriesTab;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesTab = CategoriesTab(onCategoryClick: onCategoryClick);
    currentTab =  categoriesTab;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(currentTab != categoriesTab){
          currentTab = categoriesTab;
          setState(() {});
          return Future.value(false);
        }else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("News App"),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.vertical(
            bottom: Radius.circular(22),
          )
        )),
        body: currentTab ,
      ),
    );
  }
  onCategoryClick(CategoryDm categoryDm){
    currentTab = NewsTab(categoryId: categoryDm.id);
    setState(() {});
  }
}
