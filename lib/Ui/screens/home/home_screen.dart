import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_app/Ui/screens/home/tabs/settings/settingsTab.dart';
import 'package:news_app/data/model/category_dm.dart';

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
    return SafeArea(
      child: WillPopScope(
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
          drawer: buildDrawer(),
        ),
      ),
    );

  }
  onCategoryClick(CategoryDm categoryDm){
    currentTab = NewsTab(categoryId: categoryDm.id);
    setState(() {});
  }

  buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
              child: Center(
            child: Text("News App",style: TextStyle(
              color: Colors.white,fontSize: 24
            ),),
          )
          ),
          buildDrawerRow(Icons.list, "categories", (){
            currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
            setState(() {});
            Navigator.pop(context);
          }),
          buildDrawerRow(Icons.settings, "settings", (){
            currentTab = SettingsTab();
            setState(() {});
            Navigator.pop(context);

          }),
        ],
      )
    );
  }
  buildDrawerRow(IconData iconData,String title,Function onClick){
   return InkWell(
     onTap: (){
       onClick();
     },
     child: Row(
        children: [
          SizedBox(width: 16,),
          Icon(iconData,color: Colors.black,size:35),
          SizedBox(width: 10,),
          Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
   );
  }
}
