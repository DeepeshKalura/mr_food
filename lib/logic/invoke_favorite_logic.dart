import '../controller/api/hive_api.dart';

class InvokeFavorite {
  Future<void> addData(String key, dynamic value) async {
    SharedApi().addData(key, value);
  }

  Future<dynamic> getData(String key) async {
    return SharedApi().getData(key);
  }

  // Checking it has key has any value or not
  Future<bool> hasKey(String key) async {
    return SharedApi().hasKey(key);
  }
}
