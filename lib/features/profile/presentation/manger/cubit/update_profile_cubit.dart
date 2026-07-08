import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shop/features/profile/data/repo/user_data_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.userDataRepo) : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  final UserDataRepo userDataRepo;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? imagePath;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imagePath = picked.path;
      emit(UpdateProfileInitial()); 
    }
  }

  void updateProfile() async {
    if (!formKey.currentState!.validate()) return;
    emit(UpdateProfileLoading());
    var result = await userDataRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      imagePath: imagePath,
    );
    result.fold(
      (errMessage) => emit(UpdateProfileFailure(errMessage)),
      (message) => emit(UpdateProfileSuccess(message)),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
