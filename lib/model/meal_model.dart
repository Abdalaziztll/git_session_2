// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class MealModel {
  String name;
  String description;
  num price;
  MealModel({
    required this.name,
    required this.description,
    required this.price,
  });

  MealModel copyWith({
    String? name,
    String? description,
    num? price,
  }) {
    return MealModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MealModel(name: $name, description: $description, price: $price)';

  @override
  bool operator ==(covariant MealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ price.hashCode;
}
