import 'package:flutter/material.dart';
import 'package:grocery_mart/Core/Constant/Route_Names/Route_Names.dart';
import 'package:grocery_mart/Features/Bottom_Navbar/Presentation/Bottom_Nav_Screen.dart';
import 'package:grocery_mart/Features/Cart/Presentation/Ui/Cart_Screen.dart';
import 'package:grocery_mart/Features/Detail/Presentation/UI/Detail_Screen/Detail_Screen.dart';
import 'package:grocery_mart/Features/Error/Presentation/Ui/Error_Screen.dart';
import 'package:grocery_mart/Features/On_Boarding/Presentation/Ui/On_Boarding_Screen.dart';
import 'package:grocery_mart/Features/Shop/Domain/Entity/Entity.dart';
import 'package:grocery_mart/Features/Shop/Presentation/Ui/Shop_Screen.dart';
import 'package:grocery_mart/Features/Splash/Presentation/Splash_Screen.dart';
import 'package:grocery_mart/Features/Under_Development/Presentation/Ui/Under_Dev_Screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case RouteName.cart:
      return MaterialPageRoute(builder: (_) => CartScreen());
    case RouteName.onboarding:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());

    case RouteName.shop:
      return MaterialPageRoute(builder: (_) => ShopScreen());

    case RouteName.bottomNavBar:
      return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

    case RouteName.underDevelopment:
      return MaterialPageRoute(builder: (_) => UnderDevelopmentScreen());

    case RouteName.error:
      return MaterialPageRoute(builder: (_) => ErrorScreen());
    case RouteName.detail:
      final args = settings.arguments as Map<String, dynamic>;
      final item = args['item'] as CardItemEntity;
      final backgroundColor = args['color'] as Color;

      return MaterialPageRoute(
        builder: (_) =>
            DetailScreen(item: item, backgroundColor: backgroundColor),
      );

    default:
      // fallback route for undefined route names
      return MaterialPageRoute(builder: (_) => ErrorScreen());
  }
}
