import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/Core/Constant/App_Colors/App_Colors.dart';
import 'package:grocery_mart/Core/Routes/On_Generate_Route.dart';
import 'package:grocery_mart/Features/Cart/Data/Repository_Imp/Cart_Repository_Imp.dart';
import 'package:grocery_mart/Features/Cart/Presentation/bloc/cart_bloc.dart';
import 'package:grocery_mart/Features/Cart/Presentation/bloc/cart_event.dart';
import 'Core/Constant/Route_Names/Route_Names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(CartRepositoryImpl())..add(LoadCart()),

      child: ScreenUtilInit(
        designSize: const Size(393, 852), // iPhone 15 Pro
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: AppColors.primary,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Grocery Mart',
            initialRoute: RouteName.splash,
            onGenerateRoute: generateRoute,
          );
        },
      ),
    );
  }
}
