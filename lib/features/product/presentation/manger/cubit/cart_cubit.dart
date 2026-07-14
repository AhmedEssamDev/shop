import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/features/product/data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  // اللستة الأساسية اللي فيها كل المنتجات في السلة
  List<CartItemModel> cartItems = [];

  // ---- Getters ----

  /// عدد المنتجات في السلة
  int get cartCount => cartItems.length;

  /// السعر الإجمالي
  int get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // ---- Actions ----

  /// إضافة منتج للسلة
  /// لو المنتج موجود فعلاً → بنزود الكمية
  /// لو مش موجود → بنضيفه كمنتج جديد
  void addToCart({
    required int productId,
    required String name,
    required String imagePath,
    required int price,
    required double rating,
    int quantity = 1,
  }) {
    // ندور على المنتج في السلة بالـ ID
    final index = cartItems.indexWhere((item) => item.productId == productId);

    if (index != -1) {
      // المنتج موجود → زود الكمية
      cartItems[index].quantity += quantity;
    } else {
      // المنتج مش موجود → أضفه جديد
      cartItems.add(CartItemModel(
        productId: productId,
        name: name,
        imagePath: imagePath,
        price: price,
        quantity: quantity,
        rating: rating,
      ));
    }

    _saveCart();
    emit(CartUpdated());
  }

  /// حذف منتج من السلة
  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.productId == productId);
    _saveCart();
    emit(CartUpdated());
  }

  /// تغيير كمية منتج معين
  void updateQuantity(int productId, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      if (newQuantity <= 0) {
        // لو الكمية وصلت 0 أو أقل → احذف المنتج
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = newQuantity;
      }
      _saveCart();
      emit(CartUpdated());
    }
  }

  /// تفريغ السلة بالكامل
  void clearCart() {
    cartItems.clear();
    _saveCart();
    emit(CartUpdated());
  }

  /// تحميل السلة من SharedPreferences (أول ما التطبيق يفتح)
  void loadCart() {
    final String? cartJson = CacheHelper.getValue(CacheKeys.cartItems);
    if (cartJson != null && cartJson.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(cartJson);
      cartItems = decoded.map((item) => CartItemModel.fromJson(item)).toList();
      emit(CartUpdated());
    }
  }

  /// حفظ السلة في SharedPreferences (بعد أي تعديل)
  void _saveCart() {
    final String encoded =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    CacheHelper.setValue(CacheKeys.cartItems, encoded);
  }
}
