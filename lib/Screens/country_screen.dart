import 'package:flutter/material.dart';
import 'package:magic_coffee/Screens/designer_screen.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/country_selection.dart';
import 'package:magic_coffee/models/text_option.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});
  static String id = 'CountryScreen';

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
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 50,
                    ),
                    child: TextOption(
                        'Select country and sort of coffee', mainColor),
                  ),
                  const CountrySelection('Brazil'),
                  const Divider(height: 17),
                  const CountrySelection('Colombia'),
                  const Divider(height: 17),
                  const CountrySelection('Costa Rica'),
                  const Divider(height: 17),
                  const CountrySelection('Jamaica'),
                  const Divider(height: 17),
                  const CountrySelection('Yeman'),
                  const Divider(height: 17),
                  const CountrySelection('Kenya'),
                  const Divider(height: 17),
                  const CountrySelection('India'),
                  const Divider(height: 17),
                  const CountrySelection('Tanzania'),
                  const Divider(height: 17),
                  const CountrySelection('Hawaii'),
                  const Divider(height: 17),
                  const CountrySelection('Indonesia'),
                  const Divider(height: 17),
                  const CountrySelection('Ethopia'),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(spreadRadius: 0.2)]),
                padding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: 30),
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
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
    );
  }
}
