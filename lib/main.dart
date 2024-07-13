import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_page/core/api/api_manager.dart';
import 'package:task_page/home/data/data_sources/home_ds_impl.dart';
import 'package:task_page/home/data/repositories/home_repo_impl.dart';
import 'package:task_page/home/domain/use_cases/get_products_use_case.dart';
import 'package:task_page/home/presentation/bloc/home_bloc.dart';
import 'package:task_page/home/presentation/pages/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetProductsUseCase>(
          create: (context) => GetProductsUseCase(
            HomeRepoImpl(HomeDSImpl(ApiManager())),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              getProductsUseCase: RepositoryProvider.of<GetProductsUseCase>(context),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: ProductsPage.routeName,
              routes: {
                ProductsPage.routeName: (context) => const ProductsPage(),
              },
            );
          },
        ),
      ),
    );
  }
}
