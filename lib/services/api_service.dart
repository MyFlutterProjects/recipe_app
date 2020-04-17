import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:recipe_app/models/meal_plan_model.dart';
import 'package:recipe_app/models/recipe_model.dart';

// class APIService { 
//   APIService._instance();

//   static final APIService instance = APIService._instance(); // singleton

//   final String _baseUrl ='api.spoonacular.com';
  
//   static const String API_KEY = '916970be75ae48258fffb72e0ea1ecff'; 

//   // Generate Meal plan 
//   Future<MealPlan> generateMealPlan({int targetCalories, String diet}) async { 
//     if (diet == 'None') diet = '';
//     Map<String, String> parameters ={ 
//       'titmeFrame': 'day',
//       'targetCalories': targetCalories.toString(),
//       'diet':diet,
//       'apiKey': API_KEY,
//     };
//     Uri uri = Uri.https(
//       _baseUrl,
//      '/recipes/mealplans/generate',
//       parameters,);
//      Map<String, String> headers = { 
//        HttpHeaders.contentTypeHeader: 'application/json',
//      };    

//      try { 
//         var response = await http.get(uri, headers:headers);
//          print('Response ${response.body}');
//         Map<String, dynamic> data = json.decode(response.body);
//         print('Data: $data');
//         MealPlan mealPlan = MealPlan.fromMap(data);  
//         print('Meal plan $mealPlan');
//         return mealPlan;
//      } catch(err) {
//        throw err.toString();
//      }
//   }

//   // Recipe Info 
//   Future<Recipe> fetchRecipe(String id) async { 
//     Map<String, String> parameters = { 
//       'includeNutrition': 'false',
//       'apiKey':API_KEY,
//     };
//     Uri uri = Uri.https( 
//       _baseUrl,
//       '/recipes/$id/information',
//       parameters
//     );
//     Map<String, String> headers = { 
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     try { 
//         var response = await http.get(uri, headers:headers);
//         print('Response ${response.body}');
//         Map<String, dynamic> data = json.decode(response.body);
//         Recipe recipe = Recipe.fromMap(data);  
//         return recipe;
//      } catch(err) {
//        throw err.toString();
//      }
//   }
// }

class APIService {

  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';
  static const String API_KEY = '916970be75ae48258fffb72e0ea1ecff';

  // Generate Meal Plan
  Future<MealPlan> generateMealPlan({int targetCalories, String diet}) async {
    if (diet == 'None') diet = '';
    Map<String, String> parameters = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/mealplans/generate',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  // Recipe Info
  Future<Recipe> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe recipe = Recipe.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }
}