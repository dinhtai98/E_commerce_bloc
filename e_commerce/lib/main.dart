import 'package:e_commerce/core/utils/navigation_utils.dart';
import 'package:e_commerce/global/bloc_providers.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:e_commerce/global/my_router_observer.dart';
import 'package:e_commerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  mainDelegate();
}

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...blocProviders],
      child: ScreenUtilInit(
        designSize: const Size(375, 832),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'E-Commerce',
            navigatorKey: NavigationUtils.navigatorKey,
            onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
            navigatorObservers: [MyRouteObserver()],
            initialRoute: MyRouter.splash,
            theme: ThemeData(
              primarySwatch: Colors.red,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
