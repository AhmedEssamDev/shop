import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppNotifications {
  
  static void showSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.success,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: AppColors.error,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}