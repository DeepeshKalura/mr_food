import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/recepie_list_model.dart';
import '../model/recipe_model.dart';

class SpoonacularAPI {
  static const String _baseUrl = 'https://api.spoonacular.com';
  static const String _apiKey = '7459fac1747d4870aa1b3e16dfd6036e';

  //TODO: Search Recipes and get Recipe needs to bee fixed

  // static Future<List<RecepieList>> searchRecipes(String query) async {
  //   final response = await http.get(
  //       Uri.parse('$_baseUrl/recipes/search?apiKey=$_apiKey&query=$query'));

  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     final results = json['results'] as List<dynamic>;

  //     return results.map((result) => RecepieList.fromJson(result)).toList();
  //   } else {
  //     throw Exception('Failed to load recipes');
  //   }
  // }

  // static Future<RecepieList> getRecipe(int id) async {
  //   final response = await http
  //       .get(Uri.parse('$_baseUrl/recipes/$id/information?apiKey=$_apiKey'));

  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);

  //     return RecepieList.fromJson(json);
  //   } else {
  //     throw Exception('Failed to load recipe');
  //   }
  // }

  static Future<List<Recipe>> getPopularRecipes() async {
    List<Recipe> recipeList = [];
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/recipes/complexSearch?apiKey=$_apiKey&sort=popularity&number=10'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        recipeList = RecepieList.fromJson(json).results ?? [];
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print(e);
    }
    return recipeList;
  }

  static Future<List<Recipe>> getTrendingRecipes() async {
    List<Recipe> recepieList = [];
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/recipes/complexSearch?apiKey=$_apiKey&sort=rating&number=10'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        recepieList = RecepieList.fromJson(json).results ?? [];
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print(e);
    }
    return recepieList;
  }

  // Writing a function for breakfast, lunch, dinner, and dessert
}
