import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_list/newsList.dart';
import 'package:news_app/Ui/screens/home/tabs/news/news_tab_view_model.dart';
import 'package:news_app/Ui/widgets/ErrorView.dart';
import 'package:news_app/Ui/widgets/loading_widget.dart';
import 'package:news_app/data/repos/news_repos/data_sources/online_data_source.dart';
import 'package:news_app/data/model/SourcesResponse.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;

  const NewsTab({super.key,required this.categoryId});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
int currentIndex =0;
 NewsTabViewModel viewModel = NewsTabViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSources(widget.categoryId);

    });
  }
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
      create: (_)=> viewModel,
      child:Consumer<NewsTabViewModel>(
        builder: (context,viewModel,_){
          Widget currentView;
          if(viewModel.isLoading){
            currentView = LoadingWidegt();
          }else if(viewModel.sources.isNotEmpty){
            print('jksjaksa');

            currentView = buildTabs(viewModel.sources);
          }else{
            print('error');

            currentView = ErrorView(message: viewModel.errorText??"");
          }
          return currentView;
        },
      ) ,
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
