import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../cubits/login_cubit.dart';
import '../screens/category_screen.dart';
import '../screens/error_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_list_screen.dart';

class AppRouter {
  final LoginCubit loginCubit;

  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
    routerNeglect: true,
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    debugLogDiagnostics: true,

    // initialLocation: (loginCubit.state.status == AuthStatus.unAuthenticated) ? '/' : '/login',

    routes: <GoRoute>[
      // top-lebel- route
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      // top-lebel- route
      GoRoute(
        path: '/category',
        name: 'category',
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryScreen();
        },
      ),
      // top-lebel- route
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        // sub-route
        routes: [
          GoRoute(
            path: 'product_list/:category', // product_list/:pid
            name: 'product_list',
            builder: (BuildContext context, GoRouterState state) {
              return ProductListScreen(
                category: state.params['category']!,
                asc: state.queryParams['sort'] == 'asc',
                quantity: int.parse(state.queryParams['filter'] ?? '0'),
              );
            },
          ),
        ],
      ),
      // top-lebel-route
      // GoRoute(
      //   path: '/product_list',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ProductListScreen();
      //   },
      // ),
    ],

    redirect: (BuildContext context, GoRouterState state) {
      // Check if the user is logged in.
      final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
      // Check if the user is logging in.
      final bool loggingIn = state.subloc == '/login';

      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        return '/';
      }
      return null;
    },

    refreshListenable: GoRouterRefreshSteram(loginCubit.stream),
  );
}

class GoRouterRefreshSteram extends ChangeNotifier {
  GoRouterRefreshSteram(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
