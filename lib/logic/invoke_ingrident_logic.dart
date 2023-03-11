import '../controller/api/spoonacular_api.dart';
import '../controller/model/ingrident_model.dart';

class InvokeIngridentLogic {
  Future<List<Ingredients>> getIngrident(int id) async {
    List<Ingredients> ingredients =
        await SpoonacularAPI().getIngridentSearchByID(id);
    return ingredients;
  }
}
