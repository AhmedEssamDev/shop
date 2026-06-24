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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['best_seller'] = this.bestSeller;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['is_favorite'] = this.isFavorite;
    data['name'] = this.name;
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }
}
