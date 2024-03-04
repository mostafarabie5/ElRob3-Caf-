import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Coffee%20Sort%20Cubit/coffee_sort_state.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/text_option.dart';
import '../Cubits/Coffee Sort Cubit/coffee_sort_cubit.dart';

class CoffeeSortScreen extends StatelessWidget {
  const CoffeeSortScreen({super.key});
  static String id = 'CoffeeSortScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: mainColor,
            ),
            title: Text(
              'Select country',
              style: TextStyle(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: const [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(
                width: 20,
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: BlocBuilder<CoffeeSortCubit, CoffeeSortState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 50,
                    ),
                    child: TextOption('Select a sort of coffee', mainColor),
                  ),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Santos')
                              ? const TextOption('Santos', Colors.blue)
                              : TextOption('Santos', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Santos')),
                  const Divider(height: 17),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Bourbon santos')
                              ? const TextOption('Bourbon santos', Colors.blue)
                              : TextOption('Bourbon santos', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Bourbon santos')),
                  const Divider(height: 17),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Minas')
                              ? const TextOption('Minas', Colors.blue)
                              : TextOption('Minas', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Minas')),
                  const Divider(height: 17),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Rio')
                              ? const TextOption('Rio', Colors.blue)
                              : TextOption('Rio', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Rio')),
                  const Divider(height: 17),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Canilon')
                              ? const TextOption('Canilon', Colors.blue)
                              : TextOption('Canilon', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Canilon')),
                  const Divider(height: 17),
                  GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (BlocProvider.of<CoffeeSortCubit>(context).sort ==
                                  'Falt beat')
                              ? const TextOption('Falt beat', Colors.blue)
                              : TextOption('Falt beat', mainColor),
                        ],
                      ),
                      onTap: () => BlocProvider.of<CoffeeSortCubit>(context)
                          .selectSort('Falt beat')),
                ],
              );
            },
          ),
        ));
  }
}
