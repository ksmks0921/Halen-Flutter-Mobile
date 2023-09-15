import 'package:flutter/material.dart';
import 'package:halen_customer_app/components/shimmer/shimmer_placeholder.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/screens/account/account_screen.dart';
import 'package:halen_customer_app/screens/eat/eat_tab.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_cart/grocery_cart.dart';
import 'package:halen_customer_app/screens/grocery/grocery_tab.dart';
import 'package:halen_customer_app/screens/onboarding/onboarding_screen.dart';
import 'package:halen_customer_app/screens/rideshare/ride_tab.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_cart/retail_cart.dart';
import 'package:halen_customer_app/screens/shop_retail/shop_tab.dart';
import 'package:halen_customer_app/screens/signin/sign_in.dart';
import 'package:halen_customer_app/screens/signup/registration_step1.dart';
import 'package:halen_customer_app/screens/signup/signup_screen.dart';
import 'package:halen_customer_app/screens/splashscreen/intro_splashcreen.dart';
import 'package:halen_customer_app/screens/welcome/welcome_screen.dart';
import 'package:halen_customer_app/screens/homepage/homepage_screen.dart';
import 'package:halen_customer_app/screens/add_payment/customize_card_page.dart';
import 'package:halen_customer_app/screens/orders/orders_screen.dart';
import 'package:halen_customer_app/screens/messages/messages_tab.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const IntroSplashScreen());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case registerStep1Route:
        return MaterialPageRoute(builder: (_) => const UserRegistrationStep1());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      // case rideRoute:
      //   return MaterialPageRoute(builder: (_) => const RideShareScreen());
      case customizeCardRoute:
        return MaterialPageRoute(builder: (_) => const CustomizeCardPage());
      // case retailPageRoute:
      //   return MaterialPageRoute(builder: (_) => const ShopHome());
      // case groceryPageRoute:
      //   return MaterialPageRoute(builder: (_) => const GroceryHome());
      // case eatPageRoute:
      //   return MaterialPageRoute(builder: (_) => const EatHome());
      case eatTabRoute:
        return MaterialPageRoute(builder: (_) => const EatTab());
      case rideTabRoute:
        return MaterialPageRoute(builder: (_) => const RideTab());
      case groceryTabRoute:
        return MaterialPageRoute(builder: (_) => const GroceryTab());
      case shopsTabRoute:
        return MaterialPageRoute(builder: (_) => const ShopTab());
      case ordersRoute:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case messagesTabRoute:
        return MaterialPageRoute(builder: (_) => const MessagesThreadsScreen());
      case shimmerRoute:
        return MaterialPageRoute(builder: (_) => const ShimmerEffect());
      case accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountScreen());

      case retailCartRoute:
        return MaterialPageRoute(builder: (_) => const RetailCart());
      case groceryCartRoute:
        return MaterialPageRoute(builder: (_) => const GroceryCart());
      default:
        return MaterialPageRoute(builder: (_) => const IntroSplashScreen());
    }
  }
}
