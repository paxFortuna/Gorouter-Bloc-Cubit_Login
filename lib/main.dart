import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router/app_router.dart';
import 'cubits/login_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'GoRouter Example: bloc_login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: title,
              routerConfig: AppRouter(context.read<LoginCubit>()).router,
            );
          }
      ),
      //home: const CategoryScreen(),
    );
  }
}
