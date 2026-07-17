part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {}
final class CartAddressUpdated extends CartState {
  final String newAddress;
  CartAddressUpdated(this.newAddress);
}