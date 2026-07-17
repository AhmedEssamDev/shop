import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/data/models/products_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  
  static SearchCubit get(BuildContext context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  
  List<Products> products = [];
  String currentQuery = ""; // إضافة متغير لتخزين النص الحالي

  void search(String query) async {
    currentQuery = query; // تحديث النص
    
    // إضافة تحسين: إذا كان النص فارغاً، لا تذهب للـ API
    if (query.isEmpty) {
      products = [];
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    var result = await homeRepo.searchProducts(query);
    result.fold(
      (error) => emit(SearchFailure(error.toString())),
      (products) {
        this.products = products;
        emit(SearchSuccess());
      },
    );
  }
}