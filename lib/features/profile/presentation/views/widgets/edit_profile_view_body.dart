// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shop/core/utils/app_assets.dart';
// import 'package:shop/core/utils/app_colors.dart';
// import 'package:shop/core/utils/app_validators.dart';
// import 'package:shop/core/widgets/custom_app_bar.dart';
// import 'package:shop/core/widgets/custom_button.dart';
// import 'package:shop/core/widgets/custom_text_field.dart';
// import 'package:shop/features/auth/login/data/model/user_model.dart';
// import 'package:shop/features/profile/presentation/manger/cubit/update_profile_cubit.dart';
// import 'package:shop/features/profile/presentation/views/widgets/image_manger.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';

// class EditProfileViewBody extends StatelessWidget {
//   EditProfileViewBody({super.key,required this.userData});
//   final UserModel? userData;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
//       listener: (context, state) {
//         if (state is UpdateProfileSuccess) {
//           CustomSnackBar.success(message: state.message);

//           GoRouter.of(context).pop();
//         }
//         if (state is UpdateProfileFailure) {
//           CustomSnackBar.error(message: state.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         var cubit = UpdateProfileCubit.get(context);
//         if (state is UpdateProfileLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is UpdateProfileFailure) {
//           return Center(child: Text(state.errorMessage));
//         }
//         return Padding(
//           padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
//           child: SizedBox(
//             width: double.infinity,
//             child: Form(
//               key: cubit.formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomAppBar(title: 'Profile'),
//                     SizedBox(height: 25.h),
//                     ImageManager(
//                           unselectedImageBuilder: CircleAvatar(
//                             radius: 50,
//                             backgroundColor: AppColors.primary,
//                             child: Icon(Icons.person, size: 50, color: Colors.white),
//                           ),
//                           selectedImageBuilder: (imagePath) => CircleAvatar(
//                             radius: 50,
//                             backgroundImage: FileImage(File(imagePath)),
//                           ),
//                           currentImageUrl: userData?.imagePath, // الصورة الحالية من السيرفر
//                           onImageSelected: (imagePath) {
//                             cubit.imagePath = imagePath; // نحفظ اختيار المستخدم
//                           },
//                         ),
//                     SizedBox(height: 66.h),
//                     CustomTextField(
//                       validator: (p0) {
//                         return AppValidators.requiredValidator(
//                           p0 ?? '',
//                           'Name',
//                         );
//                       },
//                       controller: cubit.nameController,
//                       keyboardType: TextInputType.text,
//                       obscureText: false,
//                       hintText: 'Full Name',
//                       prefixIcon: SvgPicture.asset(AppSvgs.person),
//                     ),
//                     SizedBox(height: 10.h),
//                     CustomTextField(
//                       validator: (p0) {
//                         return AppValidators.requiredValidator(
//                           p0 ?? '',
//                           'Phone',
//                         );
//                       },
//                       controller: cubit.phoneController,
//                       keyboardType: TextInputType.phone,
//                       obscureText: false,
//                       hintText: 'Phone',
//                       prefixIcon: SvgPicture.asset(AppSvgs.phone),
//                     ),
//                     SizedBox(height: 75.h),
//                   state is UpdateProfileLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : CustomButton(
//                       width: 327.w,
//                       backgroundColor: AppColors.primary,
//                       textColor: AppColors.white,
//                       onPressed: () {
//                         return cubit.updateProfile();
//                       },
//                       text: 'Save',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_validators.dart';
import 'package:shop/core/widgets/custom_app_bar.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/custom_text_field.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';
import 'package:shop/features/profile/presentation/manger/update_user/update_profile_cubit.dart';
import 'package:shop/features/profile/presentation/views/widgets/image_manger.dart';
import 'package:shop/core/widgets/custom_snack_bar.dart';

class EditProfileViewBody extends StatefulWidget {
  final UserModel? userData;
  const EditProfileViewBody({super.key, required this.userData});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  
  @override
  void initState() {
    super.initState();
    // ضبط النصوص مرة واحدة فقط عند فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<UpdateProfileCubit>();
      if (widget.userData != null) {
        cubit.nameController.text = widget.userData!.name ?? '';
        cubit.phoneController.text = widget.userData!.phone ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          AppNotifications.showSuccess(context, 'Profile updated successfully');
          GoRouter.of(context).pop(true);
        }
        if (state is UpdateProfileFailure) {
          AppNotifications.showError(context, 'Failed to update profile');
        }
      },
      builder: (context, state) {
        var cubit = UpdateProfileCubit.get(context);
        
        if (state is UpdateProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 22, vertical: 50),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomAppBar(title: 'Profile'),
                    SizedBox(height: 25.h),
                    ImageManager(
                      unselectedImageBuilder: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.primary,
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      selectedImageBuilder: (imagePath) => CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(imagePath)),
                      ),
                      currentImageUrl: widget.userData?.imagePath,
                      onImageSelected: (imagePath) {
                        cubit.imagePath = imagePath;
                      },
                    ),
                    SizedBox(height: 66.h),
                    CustomTextField(
                      validator: (p0) => AppValidators.requiredValidator(p0 ?? '', 'Name'),
                      controller: cubit.nameController,
                      keyboardType: TextInputType.text,
                      hintText: 'Full Name',
                      prefixIcon: SvgPicture.asset(AppSvgs.person), obscureText: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      validator: (p0) => AppValidators.requiredValidator(p0 ?? '', 'Phone'),
                      controller: cubit.phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: 'Phone',
                      prefixIcon: SvgPicture.asset(AppSvgs.phone), obscureText: false,
                    ),
                    SizedBox(height: 75.h),
                    CustomButton(
                      width: 327.w,
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: () => cubit.updateProfile(),
                      text: 'Save',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}