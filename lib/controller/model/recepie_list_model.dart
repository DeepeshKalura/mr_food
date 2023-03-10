import 'recipe_model.dart';

class RecepieList {
  List<Recipe>? results;
  int? offset;
  int? number;
  int? totalResults;

  RecepieList({this.results, this.offset, this.number, this.totalResults});

  RecepieList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Recipe>[];
      json['results'].forEach((v) {
        results!.add(Recipe.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['offset'] = offset;
    data['number'] = number;
    data['totalResults'] = totalResults;
    return data;
  }
}
