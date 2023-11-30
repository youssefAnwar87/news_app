import 'package:flutter/material.dart';

import '../../../../../model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDm categoryDm;
   CategoryWidget({required this.categoryDm});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDm.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16) ,
          topRight:Radius.circular(16) ,
          bottomLeft: categoryDm.isLeftSided ? Radius.zero : Radius.circular(16),
          bottomRight: !categoryDm.isLeftSided ? Radius.zero : Radius.circular(16),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.asset(categoryDm.imagePath,height: MediaQuery.of(context).size.height*.14),
          SizedBox(height: 4,),
          Text(categoryDm.title,style: TextStyle(color: Colors.white,fontSize: 18),),
        ],
      ),
    );
  }
}
