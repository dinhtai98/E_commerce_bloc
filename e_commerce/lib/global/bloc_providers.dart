import 'package:e_commerce/core/blocs/account_bloc/account_bloc.dart';
// ignore: implementation_imports
import 'package:flutter_bloc/src/bloc_provider.dart';

List<BlocProviderSingleChildWidget> blocProviders = [
  BlocProvider(create: (_) => AccountBloc()),
];
