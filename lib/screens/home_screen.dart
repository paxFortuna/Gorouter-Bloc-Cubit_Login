import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/login_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0000A1F),
        actions: [
          IconButton(
              onPressed: () {
                context.read<LoginCubit>().logout();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            return context.go(
              // 'path:/product_list' 대신 'name:product_list' 성능 유리
              context.namedLocation(
                'category',
              ),
            );
          },
          child: const Text('Category'),
        ),
      ),
    );
  }
}
