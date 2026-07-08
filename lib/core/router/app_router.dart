import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/core/network/api_helper.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/features/auth/auth_screen/auth_screen_view.dart';
import 'package:shop/features/auth/login/data/model/user_model.dart';
import 'package:shop/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:shop/features/auth/login/presentation/manger/login_cubit/login_cubit.dart';
import 'package:shop/features/auth/login/presentation/views/login_view.dart';
import 'package:shop/features/auth/register/data/repo/register_repo_impl.dart';
import 'package:shop/features/auth/register/presentation/manger/cubit/register_cubit.dart';
import 'package:shop/features/auth/register/presentation/views/Register_view.dart';
import 'package:shop/features/home/presentation/views/main_layout.dart';
import 'package:shop/features/onboarding/onboarding_screen_view.dart';
import 'package:shop/features/profile/data/repo/user_data_repo_impl.dart';
import 'package:shop/features/profile/presentation/manger/cubit/update_profile_cubit.dart';
import 'package:shop/features/profile/presentation/views/edit_profile_view.dart';
import 'package:shop/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

abstract class AppRouter {
  static String getInitialRoute() {
    final access = CacheHelper.getValue(CacheKeys.accessToken);
    final onboardingDone =
        CacheHelper.getValue(CacheKeys.onboardingDone) ?? false;
    if (!onboardingDone) return AppRouterKeys.onboarding;
    if (access != null && access.toString().isNotEmpty)
      return AppRouterKeys.mainLayout;
    return AppRouterKeys.authScreen;
  }

  static final appRouter = GoRouter(
    initialLocation: getInitialRoute(),
    routes: [
      GoRoute(path: '/', builder: (context, state) => OnboardingScreenView()),
      GoRoute(path: '/auth', builder: (context, state) => AuthScreenView()),
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) {
            return LoginCubit(loginRepo: LoginRepoImpl(ApiHelper()));
          },
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => BlocProvider(
          create: (context) {
            return RegisterCubit(registerRepo: RegisterRepoImpl(ApiHelper()));
          },
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: '/mainLayout',
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: '/editProfile',
        builder: (context, state) {
          final userData = state.extra as UserModel?;
          return BlocProvider(
            create: (context) =>
                UpdateProfileCubit(UserDataRepoImpl(ApiHelper())),
            child: EditProfileView(userData: userData,),
          );
        },
      ),
    ],
  );
}
