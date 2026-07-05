import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';
import 'package:shop/features/profile/data/repo/user_data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataRepo) : super(UserDataInitial());
  static UserDataCubit get(context) => BlocProvider.of(context);
  final UserDataRepo userDataRepo;
  UserModel? userData;
 void getUserData() async {
    emit(UserDataLoading());
    var result = await userDataRepo.getUserData();
    result.fold(
      (errMessage) => emit(UserDataError(errMessage)),
      (userData) {
        this.userData = userData;
        print('alert alert alert alert userData: ${userData}');
        emit(UserDataSuccess()); 
      }
    );
 }
}
