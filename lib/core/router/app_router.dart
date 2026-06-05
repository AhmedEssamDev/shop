import 'package:go_router/go_router.dart';
import 'package:shop/features/onboarding/onboarding_screen_view.dart';

abstract class AppRouter {
   static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => OnboardingScreenView()
      ),
    ]
   );
}