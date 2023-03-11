import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/ingrident_model.dart';
import '../model/recepie_list_model.dart';
import '../model/recipe_model.dart';

class SpoonacularAPI {
  static const String _baseUrl = 'https://api.spoonacular.com';
  static const String _apiKey = '7459fac1747d4870aa1b3e16dfd6036e';

  //TODO:  get Recipe needs to bee fixed

  static Future<List<Recipe>> searchRecipes(String query) async {
    List<Recipe> recipeList = [];
    try {
      final response = await http.get(
          Uri.parse('$_baseUrl/recipes/search?apiKey=$_apiKey&query=$query'));

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
          '$_baseUrl/recipes/complexSearch?apiKey=$_apiKey&sort=popularity&number=70&diet=vegetarian&cuisine=american&intolerances=egg'));
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
  static Future<List<Recipe>> getBreakfastRecipes() async {
    List<Recipe> recepieList = [];
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/recipes/complexSearch?apiKey=$_apiKey&sort=popularity&number=10&diet=vegetarian&cuisine=american&intolerances=egg'));
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

  // Implement the ingrident search by ID
  Future<List<Ingredients>> getIngridentSearchByID(int id) async {
    List<Ingredients> ingredientsList = [];
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/recipes/$id/ingredientWidget.json?apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        ingredientsList = IngridentModel.fromJson(json).ingredients ?? [];
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print(e);
    }
    return ingredientsList;
  }
}
