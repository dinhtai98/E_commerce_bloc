import 'package:e_commerce/core/blocs/account_bloc/account_bloc.dart';
import 'package:e_commerce/core/blocs/home_blocs/category_bloc/home_category_bloc.dart';
import 'package:e_commerce/core/blocs/home_blocs/product_bloc/product_bloc.dart';
// ignore: implementation_imports
import 'package:flutter_bloc/src/bloc_provider.dart';

List<BlocProviderSingleChildWidget> blocProviders = [
  BlocProvider(
      lazy: false, create: (_) => AccountBloc()..add(const AccountInitEvent())),
  BlocProvider(
    lazy: false,
    create: (_) => HomeCategoryBloc()..add(const CategoryInitEvent()),
  ),
  BlocProvider(
    lazy: false,
    create: (_) => ProductBloc()..add(const ProductInitEvent()),
  ),
];
