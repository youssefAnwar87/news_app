import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_list/newsList.dart';
import 'package:news_app/data/api/api_manger.dart';
import 'package:news_app/model/SourcesResponse.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;

  const NewsTab({super.key,required this.categoryId});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getSources(widget.categoryId),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return buildTabs(snapshot.data!);
          }else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }

  Widget buildTabs(List<Sources> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          SizedBox(height: 8,),
          TabBar(
            isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index){
                currentIndex = index;
                setState(() {});
              },
              tabs:
              list.map((source) =>  buildTabWidget(source.name??"", currentIndex == list.indexOf(source)
              )).toList()
          ),
          Expanded(
            child: TabBarView(
                children: list.map((source) => NewsList(sourceId: source.id!)).toList()
            ),
          )
        ],
      ),
    );

  }

  Widget buildTabWidget(String name,bool isSelected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color:  Colors.blue),
      ),
      child: Text(name,style: TextStyle(color: isSelected ? Colors.white : Colors.blue) ,),
    );
  }
}
