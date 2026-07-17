import 'package:shop/features/home/data/models/products_model.dart';

class CategoriesModel {
  List<Categories>? categories;
  bool? status;

  CategoriesModel({this.categories, this.status});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Categories {
  String? description;
  int? id;
  String? imagePath;
  List<Products>? products;
  String? title;

  Categories(
      {this.description, this.id, this.imagePath, this.products, this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'] != null ? (json['id'] as num).toInt() : null;
    imagePath = json['image_path'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}

