class ProductsModel {
  List<Products>? products;
  bool? status;

  ProductsModel({this.products, this.status});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}



class Products {
  int? bestSeller;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  int? price;
  double? rating;

  Products(
      {this.bestSeller,
      this.description,
      this.id,
      this.imagePath,
      this.isFavorite,
      this.name,
      this.price,
      this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    bestSeller = json['best_seller'] != null ? (json['best_seller'] as num).toInt() : null;
    description = json['description'];
    id = json['id'] != null ? (json['id'] as num).toInt() : null;
    imagePath = json['image_path'];
    isFavorite = json['is_favorite'];
    name = json['name'];
    price = json['price'] != null ? (json['price'] as num).toInt() : null;
    rating = json['rating'] != null ? (json['rating'] as num).toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['best_seller'] = bestSeller;
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['is_favorite'] = isFavorite;
    data['name'] = name;
    data['price'] = price;
    data['rating'] = rating;
    return data;
  }
}
