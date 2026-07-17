class BestSellerModel {
  List<BestSellerProducts>? bestSellerProducts;
  bool? status;

  BestSellerModel({this.bestSellerProducts, this.status});

  BestSellerModel.fromJson(Map<String, dynamic> json) {
    if (json['best_seller_products'] != null) {
      bestSellerProducts = <BestSellerProducts>[];
      json['best_seller_products'].forEach((v) {
        bestSellerProducts!.add(BestSellerProducts.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (bestSellerProducts != null) {
      data['best_seller_products'] =
          bestSellerProducts!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class BestSellerProducts {
  int? bestSeller;
  Category? category;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  int? price;
  double? rating;

  BestSellerProducts(
      {this.bestSeller,
      this.category,
      this.description,
      this.id,
      this.imagePath,
      this.isFavorite,
      this.name,
      this.price,
      this.rating});

  BestSellerProducts.fromJson(Map<String, dynamic> json) {
    bestSeller = json['best_seller'] != null ? (json['best_seller'] as num).toInt() : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
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

class Category {
  String? description;
  int? id;
  String? imagePath;
  String? title;

  Category({this.description, this.id, this.imagePath, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['title'] = title;
    return data;
  }
}
