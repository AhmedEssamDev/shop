abstract class AppValidators {
  
  // 1. التحقق من البريد الإلكتروني
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // 2. التحقق من كلمة المرور (قوة كلمة المرور)
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    // مثال: التحقق من وجود رقم وحرف (اختياري)
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  // 3. التحقق من النصوص المطلوبة (مثل الاسم)
  static String? requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // 4. التحقق من رقم الهاتف
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // 5. التحقق من تطابق حقلين (مثل تأكيد كلمة المرور)
  static String? confirmPasswordValidator(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}