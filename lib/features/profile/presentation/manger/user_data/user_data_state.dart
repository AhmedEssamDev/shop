part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {}

final class UserDataError extends UserDataState {
  final String message;
  UserDataError(this.message);
}

final class FavoriteActionLoading extends UserDataState {}

final class FavoriteActionSuccess extends UserDataState {
  final String message;
  FavoriteActionSuccess(this.message);
}

final class FavoriteActionError extends UserDataState {
  final String message;
  FavoriteActionError(this.message);
}
