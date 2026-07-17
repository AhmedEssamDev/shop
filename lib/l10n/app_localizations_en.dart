// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Shop App';

  @override
  String get cartTitle => 'My Cart';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get failedToUpdateProfile => 'Failed to update profile';

  @override
  String get profile => 'Profile';

  @override
  String get fullName => 'Full Name';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone';

  @override
  String get save => 'Save';

  @override
  String get unknown => 'Unknown';

  @override
  String get myProfile => 'My Profile';

  @override
  String get myOrders => 'My Orders';

  @override
  String get myFavorites => 'My Favorites';

  @override
  String get logOut => 'Log Out';

  @override
  String get noFavoritesYet => 'No favorites yet!';

  @override
  String get tapHeartIcon =>
      'Tap the heart icon on any product\nto add it to your favorites.';

  @override
  String get active => 'Active';

  @override
  String get completed => 'Completed';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get youDontHaveAny => 'You don\'t have any';

  @override
  String get ordersAtThisTime => 'orders at this time';

  @override
  String get item => 'item';

  @override
  String get items => 'Items';

  @override
  String get cancel => 'Cancel';

  @override
  String get complete => 'Complete';

  @override
  String get orderDelivered => 'Order delivered';

  @override
  String get orderCanceled => 'Order Canceled';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get orderNo => 'Order No. ';

  @override
  String get orderTotal => 'Order Total';

  @override
  String get totalOrder => 'Total Order';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String get cart => 'Cart';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get address => 'Address';

  @override
  String get pickAddress => 'Pick the address from map';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get shoppingList => 'Shopping List';

  @override
  String get orderPlacedSuccessfully => 'Order Placed Successfully';

  @override
  String get checkout => 'Checkout';

  @override
  String get totalPlusTaxes => 'Total, plus taxes and delivery:';

  @override
  String get alreadyInFavorites => 'Already in your favorites ❤️';

  @override
  String get addedToCartSuccessfully => 'Added to cart successfully!';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get product => 'Product';

  @override
  String get home => 'Home';

  @override
  String get allFeatured => 'All Featured';

  @override
  String get bestSellers => 'Best Sellers';

  @override
  String get search => 'Search';

  @override
  String get searchAnyProduct => 'Search any Product..';

  @override
  String get createAccount => 'Create an\naccount!';

  @override
  String get welcomeBack => 'Welcome\nBack!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get login => 'Login';

  @override
  String get createAccountBtn => 'Create Account';

  @override
  String welcomeBackMsg(Object name) {
    return 'Welcome Back $name!';
  }

  @override
  String get register => 'Register';

  @override
  String get authHeadline => 'You want\nAuthentic, here\nyou go!';

  @override
  String get authSubtitle => 'Find it here, buy it now!';

  @override
  String get agreeText => 'By clicking the';

  @override
  String get agreeRegister => ' Register ';

  @override
  String get agreeOffer => 'button, you agree\nto the public offer';
}
