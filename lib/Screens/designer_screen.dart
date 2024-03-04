import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Designer%20Cubit/designer_cubit.dart';
import 'package:magic_coffee/Screens/additives_screen.dart';
import 'package:magic_coffee/Screens/country_screen.dart';
import 'package:magic_coffee/Screens/my_order_screen.dart';
import 'package:magic_coffee/Screens/order_screen.dart';
import 'package:magic_coffee/constants.dart';

import '../Cubits/Designer Cubit/designer_state.dart';

class DesignerScreen extends StatelessWidget {
  const DesignerScreen({super.key});
  static const String id = 'DesignerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: mainColor,
            ),
            title: Text(
              'Coffee lover assemblage',
              style: TextStyle(
                color: mainColor,
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
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 13,
            right: MediaQuery.of(context).size.width / 13,
            top: MediaQuery.of(context).size.width / 16,
          ),
          child: BlocBuilder<DesignerCubit, DesignerState>(
            builder: (context, state) => Column(
              children: [
                GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select a barista',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: mainColor,
                        )
                      ],
                    ),
                    onTap: () {}),
                const SizedBox(height: 8),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coffee type',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Column(children: [
                      Slider(
                        value: BlocProvider.of<DesignerCubit>(context)
                            .percent
                            .toDouble(),
                        max: 100,
                        divisions: 100,
                        onChanged: (value) =>
                            BlocProvider.of<DesignerCubit>(context)
                                .chooseCoffeeType(value.round()),
                        thumbColor: Colors.white,
                        activeColor: Colors.blue,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Arabica',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 80),
                          Text(
                            'Robusta',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ])
                  ],
                ),
                const Divider(),
                const SizedBox(height: 8),
                GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Coffee Sort',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: mainColor,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, CountryScreen.id);
                    }),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Roasting',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grinding',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: (BlocProvider.of<DesignerCubit>(context)
                                      .grinding ==
                                  1)
                              ? Image.asset(
                                  'assets/images/Grinding1_chosen.png')
                              : Image.asset(
                                  'assets/images/Grinding1_unchosen.png'),
                          onTap: () => BlocProvider.of<DesignerCubit>(context)
                              .chooseGrinding(1),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                            child: (BlocProvider.of<DesignerCubit>(context)
                                        .grinding ==
                                    2)
                                ? Image.asset(
                                    'assets/images/Grinding2_chosen.png')
                                : Image.asset(
                                    'assets/images/Grinding2_unchosen.png'),
                            onTap: () => BlocProvider.of<DesignerCubit>(context)
                                .chooseGrinding(2))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                GestureDetector(
                  child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Milk',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Select',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                      type: 'Milk',
                                      appBarColor: Colors.grey.withOpacity(0.5),
                                    )));
                      }),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Syrup',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Select',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen(
                                    type: 'Syrup',
                                    appBarColor: Colors.grey.withOpacity(0.5),
                                  )));
                    }),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Additives',
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: mainColor,
                      )
                    ],
                  ),
                  onTap: () => Navigator.pushNamed(context, AdditivesScreen.id),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                const Spacer(flex: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'EGP 9.50',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                GestureDetector(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, MyOrderScreen.id);
                    }),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ));
  }
}
