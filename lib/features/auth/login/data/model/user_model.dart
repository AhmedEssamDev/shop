class UserModel {
  String? email;
  List<dynamic>? favoriteProducts;
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
        favoriteProducts!.add(v);
      });
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    if (this.favoriteProducts != null) {
      data['favorite_products'] = this.favoriteProducts!.map((v) => v).toList();
    }
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
