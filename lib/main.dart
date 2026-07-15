import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/router/app_router.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/product/data/repo/place_order_repo_impl.dart';
import 'package:shop/features/product/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop/features/product/presentation/manger/cubit/place_order_cubit.dart';
import 'package:shop/features/profile/data/repo/user_data_repo_impl.dart';
import 'package:shop/features/profile/presentation/manger/user_data/user_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()..loadCart()),
        BlocProvider(create: (context) => PlaceOrderCubit(PlaceOrderRepoImpl(ApiHelper()))),
        BlocProvider(create: (context) => UserDataCubit(UserDataRepoImpl(ApiHelper()))..getUserData()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        ensureScreenSize: true,
        minTextAdapt: true,
        splitScreenMode: true,
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
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'shop',
            routerConfig: AppRouter.appRouter,
          );
        },
      ),
    );
  }
}