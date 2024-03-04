import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/milk_syrup_component.dart';

class MilkSyrupMenu extends StatelessWidget {
  const MilkSyrupMenu(
    this.type, {
    super.key,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: (type == 'Milk')
                        ? const Text('What type of milk do you prefer?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))
                        : const Text('What flavor of syrup do you prefer?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))),
                const Divider(),
                MilkSyrupSelection('None', type),
                const Divider(),
                (type == 'Milk')
                    ? MilkSyrupSelection('Cow\'s', type)
                    : MilkSyrupSelection('Amaretto', type),
                const Divider(),
                (type == 'Milk')
                    ? MilkSyrupSelection('Lactose-free', type)
                    : MilkSyrupSelection('Coconut', type),
                const Divider(),
                (type == 'Milk')
                    ? MilkSyrupSelection('Skimmed', type)
                    : MilkSyrupSelection('Vanilla', type),
                const Divider(),
                (type == 'Milk')
                    ? MilkSyrupSelection('Vegatable', type)
                    : MilkSyrupSelection('Caramel', type),
              ],
            ),
          ),
          GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Text('Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
