import 'package:e_commerce/core/blocs/account_bloc/account_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (_) => AccountBloc()),
];
