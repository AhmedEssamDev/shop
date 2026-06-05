import 'package:go_router/go_router.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/core/router/app_router_keys.dart';
import 'package:shop/features/auth/auth_screen/auth_screen_view.dart';
import 'package:shop/features/onboarding/onboarding_screen_view.dart';

abstract class AppRouter {
   static String getInitialRoute(){
    final onboardingDone = CacheHelper.getValue(CacheKeys.onboardingDone) ?? false;
    if (!onboardingDone) return AppRouterKeys.onboarding;
    return AppRouterKeys.authScreen;
   }
   static final appRouter = GoRouter(
    initialLocation: getInitialRoute(),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => OnboardingScreenView()
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => AuthScreenView()
      ),
    ]
   );
}