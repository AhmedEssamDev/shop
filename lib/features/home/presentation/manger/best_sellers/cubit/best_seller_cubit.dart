import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/features/home/data/models/best_seller_model.dart';
import 'package:shop/features/home/data/repos/home_repo.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());
  List<BestSellerProducts>? bestSeller;
  static BestSellerCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
 
  Future<void> getBestSeller() async {
    emit(BestSellerLoading());
    var result = await homeRepo.fetchBestSeller();
    result.fold(
      (error) {
        print('BestSeller Error: $error');
        emit(BestSellerFailure(error.toString()));
      },
      (bestSeller) {
        this.bestSeller = bestSeller;
        emit(BestSellerSuccess());
      },
    );
  }
}
