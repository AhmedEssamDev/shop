import 'package:shop/features/home/data/models/products_model.dart';

class UserModel {
  String? email;
  List<Products>? favoriteProducts;
  int? id;
  String? imagePath;
  String? name;
  String? phone;

  UserModel({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['favorite_products'] != null) {
      favoriteProducts = [];
      json['favorite_products'].forEach((v) {
        favoriteProducts!.add(Products.fromJson(v));
      });
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    if (favoriteProducts != null) {
      data['favorite_products'] = favoriteProducts!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
