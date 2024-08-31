import 'dart:convert';

class RestaurantsModel {
  final int? id;
  final String? name;
  final String? cuisine;
  const RestaurantsModel({
    this.id,
    this.name,
    this.cuisine,
  });

  RestaurantsModel copyWith({
    int? id,
    String? name,
    String? cuisine,
  }) {
    return RestaurantsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cuisine: cuisine ?? this.cuisine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cuisine': cuisine,
    };
  }

  factory RestaurantsModel.fromMap(Map<String, dynamic> map) {
    return RestaurantsModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      cuisine: map['cuisine'] != null ? map['cuisine'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantsModel.fromJson(String source) =>
      RestaurantsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
