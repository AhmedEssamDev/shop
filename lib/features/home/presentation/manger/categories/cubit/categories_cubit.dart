import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/data/models/categories_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  List<Categories>? categories;
  static CategoriesCubit get(BuildContext context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(CategoriesIndexChanged());
  }


  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchCategories();
    result.fold(
      (error) => emit(CategoriesFailure(error.toString())),
      (categories) {
        this.categories = categories;
        emit(CategoriesSuccess());
      },
    );
  }
}
