part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}
final class BestSellerLoading extends BestSellerState {}
final class BestSellerSuccess extends BestSellerState {}
final class BestSellerFailure extends BestSellerState {
  final String message;
  BestSellerFailure(this.message);
}