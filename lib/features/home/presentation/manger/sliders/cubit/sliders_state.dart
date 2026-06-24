part of 'sliders_cubit.dart';

@immutable
sealed class SlidersState {}

final class SlidersInitial extends SlidersState {}

final class SlidersLoading extends SlidersState {}

final class SlidersSuccess extends SlidersState {}

final class SlidersFailure extends SlidersState {
  final String errMessage;

  SlidersFailure(this.errMessage);
}

final class SlidersChangePage extends SlidersState {}