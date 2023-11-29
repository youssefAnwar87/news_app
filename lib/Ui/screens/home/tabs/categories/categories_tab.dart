import 'package:flutter/material.dart';
import 'package:news_app/Ui/screens/home/tabs/categories/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  static const String  routeName ="categories";

  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pick your category"),
        GridView.builder(
          itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            itemBuilder: ( context,index){
            return CategoryWidget();
            }
        )
      ],
    );
  }
}
