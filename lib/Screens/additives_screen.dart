import 'package:flutter/material.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/additives_selection.dart';
import 'package:magic_coffee/models/text_option.dart';

class AdditivesScreen extends StatelessWidget {
  const AdditivesScreen({super.key});
  static String id = 'AdditivesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: mainColor,
            ),
            title: Text(
              'Coffee lover assemblage',
              style: TextStyle(color: mainColor, fontWeight: FontWeight.w600),
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
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 50,
                ),
                child: TextOption('Select additives', mainColor),
              ),
              const AdditivesSelection('Ceylon cinnamon'),
              const Divider(height: 17),
              const AdditivesSelection('Grated chocolate'),
              const Divider(height: 17),
              const AdditivesSelection('Liquid chocolate'),
              const Divider(height: 17),
              const AdditivesSelection('Marshmallow'),
              const Divider(height: 17),
              const AdditivesSelection('Whipped cream'),
              const Divider(height: 17),
              const AdditivesSelection('Cream'),
              const Divider(height: 17),
              const AdditivesSelection('Nutmeg'),
              const Divider(height: 17),
              const AdditivesSelection('Ice Cream'),
            ],
          ),
        ));
  }
}
