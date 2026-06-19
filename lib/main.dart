import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/router/app_router.dart';
import 'package:shop/core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primary,
            circularTrackColor: Colors.grey,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: AppColors.borderColor, 
            cursorColor: AppColors.borderColor,            
            selectionHandleColor: AppColors.borderColor, 
          )
          ),
          debugShowCheckedModeBanner: false,
          title: 'shop',
          routerConfig: AppRouter.appRouter,
        );
      },
    );
  }
}
