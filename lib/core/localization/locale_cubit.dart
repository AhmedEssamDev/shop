import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/cache/cache_helper.dart'; 

class LocaleCubit extends Cubit<Locale> {
  // نبدأ باللغة الإنجليزية كافتراضية، وبمجرد تشغيل التطبيق نقرأ الكاش
  LocaleCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
  }
  void _loadSavedLanguage() {
    // نقرأ الكود المحفوظ (ar أو en)
    String? savedLang = CacheHelper.getValue('app_lang');
    if (savedLang != null) {
      emit(Locale(savedLang));
    }
  }
 
  // هذه الدالة سنستدعيها من زر الإعدادات 
  void changeLanguage(String langCode) {
    // نحفظ اللغة الجديدة في الكاش
    CacheHelper.setValue('app_lang',langCode);
    // نحدث حالة التطبيق باللغة الجديدة
    emit(Locale(langCode));
  }
}
