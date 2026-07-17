import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/data/models/sliders_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';


part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit(this.homeRepo) : super(SlidersInitial());
  List<Sliders>? sliders;
  static SlidersCubit get(BuildContext context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  int currentIndex = 0;

  void changePage(int index){
    currentIndex = index;
    emit(SlidersChangePage());
  }

  Future<void> getSliders() async {
    emit(SlidersLoading());
    var result = await homeRepo.fetchSliders();
    result.fold(
      (error) => emit(SlidersFailure(error.toString())),
      (sliders) {
        this.sliders = sliders;
        emit(SlidersSuccess());
      },
    );
  }
}
