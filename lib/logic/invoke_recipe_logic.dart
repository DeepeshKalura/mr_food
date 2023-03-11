import '../controller/api/spoonacular_api.dart';
import '../controller/model/recipe_model.dart';

class InvokingAPI {
  Future<List<Recipe>> getPopularRecipe() async {
    final recipeList = await SpoonacularAPI.getPopularRecipes();
    return recipeList;
  }

  Future<List<Recipe>> getTrendingRecipe() async {
    final recipeList = await SpoonacularAPI.getTrendingRecipes();

    return recipeList;
  }

  Future<List<Recipe>> getSearchRecipe(String query) async {
    final recipeList = await SpoonacularAPI.searchRecipes(query);

    return recipeList;
  }
}
