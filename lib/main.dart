import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Additive%20Cubit/additive_cubit.dart';
import 'package:magic_coffee/Cubits/Coffee%20Sort%20Cubit/coffee_sort_cubit.dart';
import 'package:magic_coffee/Cubits/Designer%20Cubit/designer_cubit.dart';
import 'package:magic_coffee/Cubits/Order%20Cubit/order_cubit.dart';
import 'package:magic_coffee/Screens/additives_screen.dart';
import 'package:magic_coffee/Screens/authorization.dart';
import 'package:magic_coffee/Screens/coffee_sort_screen.dart';
import 'package:magic_coffee/Screens/country_screen.dart';
import 'package:magic_coffee/Screens/designer_screen.dart';
import 'package:magic_coffee/Screens/edit_profile.dart';
import 'package:magic_coffee/Screens/forget_password_screen.dart';
import 'package:magic_coffee/Screens/menu_screen.dart';
import 'package:magic_coffee/Screens/my_order_screen.dart';
import 'package:magic_coffee/Screens/order_screen.dart';
import 'package:magic_coffee/Screens/profile_screen.dart';
import 'package:magic_coffee/Screens/registeration_screen.dart';
import 'package:magic_coffee/Screens/splash_screen.dart';
import 'package:magic_coffee/Screens/two_factor_verification.dart';
import 'package:magic_coffee/Screens/welcome_screen.dart';
import 'Cubits/Auth Cubit/auth_cubit.dart';
import 'Cubits/Country Cubit/country_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MagicCoffee());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MagicCoffee extends StatelessWidget {
  const MagicCoffee({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
        BlocProvider(
          create: (context) => DesignerCubit(),
        ),
        BlocProvider(
          create: (context) => CoffeeSortCubit(),
        ),
        BlocProvider(
          create: (context) => CountryCubit(),
        ),
        BlocProvider(
          create: (context) => AdditiveCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          AuthorizationScreen.id: (context) => AuthorizationScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
          TwoFactorVerification.id: (context) => const TwoFactorVerification(),
          SplashScreen.id: (context) => const SplashScreen(),
          MenuScreen.id: (context) => const MenuScreen(),
          OrderScreen.id: (context) => OrderScreen(),
          DesignerScreen.id: (context) => const DesignerScreen(),
          CountryScreen.id: (context) => const CountryScreen(),
          CoffeeSortScreen.id: (context) => const CoffeeSortScreen(),
          AdditivesScreen.id: (context) => const AdditivesScreen(),
          MyOrderScreen.id: (context) => const MyOrderScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
          EditProfileScreen.id: (context) => EditProfileScreen(),
        },
        home: const WelcomeScreen(),
      ),
    );
  }
}
