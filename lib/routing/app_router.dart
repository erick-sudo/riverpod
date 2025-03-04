import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodtutorial/refresh_listenable.dart';
import 'package:riverpodtutorial/repositories/firebase_auth_repository.dart';
import 'package:riverpodtutorial/screens/home_screen.dart';
import 'package:riverpodtutorial/screens/signin_screen.dart';
import 'package:riverpodtutorial/screens/signup_screen.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  final auth = ref.watch(authRepositoryProvider);
  return GoRouter(
    navigatorKey: _key,
    initialLocation: HomeScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: SignInScreen.path,
        name: SignInScreen.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: SignUpScreen.path,
        name: SignUpScreen.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignUpScreen(),
        ),
      ),
    ],
    refreshListenable: GoRouterRefreshStream(auth.authStateChanges()),
    redirect: (context, state) async {
      final bool isLoggedIn = auth.currentUser != null;
      final bool isLoggingIn = state.matchedLocation == SignInScreen.path ||
          state.matchedLocation == SignUpScreen.path;

      // should redirect the user to the sign in page if they are not logged in
      if (!isLoggedIn && !isLoggingIn) {
        return SignInScreen.path;
      }

      // should redirect the user after they have logged in
      if (isLoggedIn && isLoggingIn) {
        return HomeScreen.path;
      }
      return null;
    },
  );
}
