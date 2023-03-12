import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../model/recipe_model.dart';

//TODO: I will implement this feature later
class SharedApi {
  Future<void> addData(String key, List<Recipe> value) async {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    var prefs = await Hive.openBox('Recipe');
    prefs.put(key, value);
  }

  Future<dynamic> getData(String key) async {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    var prefs = await Hive.openBox('Recipe');
    return prefs.get(key);
  }

  Future<bool> hasKey(String key) async {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    var prefs = await Hive.openBox('Recipe');
    return prefs.containsKey(key);
  }
}
