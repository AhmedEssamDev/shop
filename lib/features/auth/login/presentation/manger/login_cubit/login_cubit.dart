import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';
import 'package:shop/features/auth/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  final LoginRepo loginRepo;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());
  }
  Future login()async{
    if(formKey.currentState?.validate() == false) return;
    emit(LoginLoading());
    var result = await loginRepo.login(email: emailController.text, password: passwordController.text);
    result.fold((errMessage) => emit(LoginFailure(errMessage: errMessage)), 
    (userModel) {
      emit(LoginSuccess(userModel: userModel));
    });
  }
}
