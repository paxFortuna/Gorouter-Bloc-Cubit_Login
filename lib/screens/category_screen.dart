import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/login_cubit.dart';
import '../models/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Category> categories = Category.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color(0xFF0000A1F),
        actions: [
          IconButton(
              onPressed: () {
                context.read<LoginCubit>().logout();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {

            Category category = categories[index];

            return ListTile(
              title: Text(category.name),
              onTap: () {
                return context.go(
                  // 'path:/product_list' 대신 'name:product_list' 성능 유리
                  context.namedLocation(
                    'product_list',
                    params: <String, String>{'category': category.name},
                    queryParams: <String, String>{
                      'sort': 'desc',
                      'filter': '0'
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
