import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:strix/screen/productui.dart';
import 'package:strix/screen/recipe.api.dart';
import 'package:strix/screen/recipe.dart';
import 'package:strix/screen/recipe_card.dart';
import 'package:strix/screen/shoppingscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {
    List<Recipe>? _recipe;
  bool _isLoading = true;
   @override
void initState(){
   
    super.initState();
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if(isAllowed==false){

      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
   getRecipes();

}

 Future<void> getRecipes() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipe);
  }
  //final List items=['Product 1','Product 2','Product 3','Product 4','Product 5',] ;
  @override
  Widget build(BuildContext context) {
return Scaffold(
        body:
         _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe!.length,
                itemBuilder: (context, index) {
                  return
              
                  RecipeCard(
                      title: _recipe![index].name,
                      cookTime: _recipe![index].totalTime,
                      rating: _recipe![index].rating.toString(),
                      thumbnailUrl: _recipe![index].images);
                },
                
              ),
               backgroundColor: Colors.grey.shade200,
              );
              
  }
  
}







   
//     return Scaffold(
//       body:_isLoading
//             ? Center(child: CircularProgressIndicator()):
// ListView.builder(itemCount: _recipe ?.length,
//                 itemBuilder: (context,index){
//         return  productUi(link: _recipe![index].images,);
//       }),
//       backgroundColor:Colors.grey.shade200,
//     );
    
//   }
// }


// class Recipe {
//   final String images;

//   Recipe({required this.images});

//   factory Recipe.fromJson(dynamic json) {
//     return Recipe(
       
//         images: json['images'][0]['hostedLargeUrl'] as String,);
//   }

//   static List<Recipe> recipesFromSnapshot(List snapshot) {
//     return snapshot.map((data) {
//       return Recipe.fromJson(data);
//     }).toList();
//   }

//   @override
//   String toString(){
//     return 'Recipe {image: $images}';
//   }
// }

// class RecipeApi {
//   //static get http => null;

//   static Future<List<Recipe>> getRecipe() async {
//     var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
//         {"limit": "24", "start": "0"});

//     final response = await http.get(uri, headers: {
//       "x-rapidapi-key": "89156b0ed8mshe58f4d56e8c5e92p131c5djsnb16973ac4b7d",
//       "x-rapidapi-host": "yummly2.p.rapidapi.com'",
//       "useQueryString": "true"
//     });

//     Map data = jsonDecode(response.body);
//     List _temp = [];

//     for (var i in data['feed']) {
//       _temp.add(i['content']['details']);
//     }

//     return Recipe.recipesFromSnapshot(_temp);
//   }
// }
