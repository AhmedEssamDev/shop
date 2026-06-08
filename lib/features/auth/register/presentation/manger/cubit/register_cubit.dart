import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/auth/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);


  final RegisterRepo registerRepo;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  bool isPassword = true;
  void PasswordVisibility(){
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());

  }
  Future register() async {
    print("--- Debugging Register Data ---");
  print("Name: ${nameController.text}");
  print("Phone: ${phoneController.text}");
  print("Email: ${emailController.text}");
  print("Password: ${passwordController.text}");
  print("Confirm Password: ${confirmPasswordController.text}");
  print("-------------------------------");
    emit(RegisterLoading());
    if (formKey.currentState!.validate() == false) return;
    var result = await registerRepo.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
    );
    result.fold(
      (errMessage) => emit(RegisterFailure(errMessage)),
      (successMessage) => emit(RegisterSuccess(successMessage)),
    );
  }
}
