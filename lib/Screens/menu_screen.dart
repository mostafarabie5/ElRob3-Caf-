import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Screens/designer_screen.dart';
import 'package:magic_coffee/Screens/profile_screen.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/Components/coffee_cart.dart';
import 'package:http/http.dart' as http;

import '../Cubits/Auth Cubit/auth_cubit.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  static String id = 'MenuScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Color(0xFFC1C0C0),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      (BlocProvider.of<AuthCubit>(context)
                          .user
                          ?.user!
                          .displayName)!,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () async {
                        print(1);

                        var url = Uri.parse(
                            'https://10.0.2.2:7156/api/Clubs/AllClubs');
                        http.Response response = await http.get(url);
                        String jsonData = response.body;
                        dynamic decode = jsonDecode(jsonData);
                        print(jsonData);
                        print(decode[1]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline),
                      onPressed: () {
                        Navigator.pushNamed(context, ProfileScreen.id);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: const Text(
                      'Select your coffee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, line) => GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: drinks.length,
                        itemBuilder: (context, index) =>
                            CoffeeCart(name: drinks[index]),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 1),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.home,
                            size: 30,
                          ),
                          const SizedBox(width: 60),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, DesignerScreen.id);
                            },
                            icon: const Icon(
                              Icons.card_giftcard_sharp,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 60),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, DesignerScreen.id);
                            },
                            icon: const Icon(Icons.list_alt_outlined, size: 30),
                            color: Colors.grey,
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
