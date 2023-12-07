import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/categories/category_widget.dart';
import 'package:news_app/data/model/category_dm.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDm) onCategoryClick;
  static const String  routeName ="categories";

  const CategoriesTab({super.key,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text("Pick your category"),
          SizedBox(height: 30,),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryDm.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2
                ),
                itemBuilder: ( context,index){
                return InkWell(
                  onTap: (){
                    onCategoryClick(CategoryDm.categories[index]);
                  },
                    child: CategoryWidget(categoryDm: CategoryDm.categories[index],));
                }
            ),
          )
        ],
      ),
    );
  }
}
