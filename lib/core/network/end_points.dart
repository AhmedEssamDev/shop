abstract class EndPoints {
  static const String baseUrl =
      'https://nti-ecommerce-api-production-eec2.up.railway.app/api/';
  static const String refreshToken = 'refresh_token';
  static const String login = 'login';
  static const String register = 'register';
  static const String categories = 'categories';
  static const String sliders = 'sliders';
  static const String bestSeller = 'best_seller_products';
  static const String getuserData = 'get_user_data';
  static const String updateProfile = 'update_profile';
  static const String search = 'products/search?q=';
  static const String placeOrder = 'place_order';
  static const String orders = 'orders';
  static const String cancelOrder = 'orders/cancel/';
  static const String completeOrder = 'orders/complete/';
  static const String addToFavorite = 'add_to_favorite';
}
