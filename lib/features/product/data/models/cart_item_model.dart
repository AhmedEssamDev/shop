class CartItemModel {
  final int productId;
  final String name;
  final String imagePath;
  final int price;
  final double rating;
  int quantity;
  
  CartItemModel({
    required this.productId,
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1, 
    required this.rating,
  });

  // عشان نحفظ في SharedPreferences كـ JSON
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'image_path': imagePath,
      'price': price,
      'quantity': quantity,
      'rating': rating,
    };
  }

  // عشان نقرأ من SharedPreferences
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'],
      name: json['name'],
      imagePath: json['image_path'],
      price: json['price'],
      quantity: json['quantity'],
       rating: json['rating'],
    );
  }
}
