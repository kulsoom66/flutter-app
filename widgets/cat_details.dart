import 'package:flutter/material.dart';

import '../../models/dummy_data.dart';
import '../models/recipts_item.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName = '/cat_details';

  
  @override
  Widget build(BuildContext context) {

    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;// app bar 
    //ModalRoute.of => This method returns the current route with the arguments.

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id']; 

    final filteredCat = DUMMY_RECIPTS.where((recipt) {
      return recipt.categories.contains(categoryId); // categoryId why????????? 
      // بيرجعلي كل الوصفات اللي تحتوي على الكاتوجري 
      // اللي فيها نفس الاي دي
    }).toList();



    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){ //what is itemBuilder?? context? index!?
          return ReciptsItems(
            title: filteredCat[index].title,//why [index] 
            imageUrl: filteredCat[index].imageUrl,
            duration: filteredCat[index].duration,
            complexity: filteredCat[index].complexity,
            affordability: filteredCat[index].affordability,
          );
        },
        itemCount: filteredCat.length, //what is this?????? to stop the loop
      )
    );
  }
}
