import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Additive%20Cubit/additive_cubit.dart';
import 'package:magic_coffee/Screens/order_screen.dart';
import 'package:magic_coffee/constants.dart';

import '../Cubits/Coffee Sort Cubit/coffee_sort_cubit.dart';
import '../Cubits/Country Cubit/country_cubit.dart';
import '../Cubits/Designer Cubit/designer_cubit.dart';
import '../Cubits/Order Cubit/order_cubit.dart';

class CoffeeCart extends StatelessWidget {
  const CoffeeCart({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(drinkImage[name]!),
              const SizedBox(height: 6),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF384C5A),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          BlocProvider.of<OrderCubit>(context).reset();
          BlocProvider.of<DesignerCubit>(context).reset();
          BlocProvider.of<CountryCubit>(context).reset();
          BlocProvider.of<CoffeeSortCubit>(context).reset();
          BlocProvider.of<AdditiveCubit>(context).reset();
          BlocProvider.of<OrderCubit>(context).drink = name;
          Navigator.pushNamed(context, OrderScreen.id);
        });
  }
}
