import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:magic_coffee/Cubits/Order%20Cubit/order_state.dart';
import 'package:magic_coffee/Screens/designer_screen.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/Components/order_spacer.dart';
import 'package:magic_coffee/models/text_option.dart';
import '../Components/restretto_component.dart';
import '../Cubits/Order Cubit/order_cubit.dart';
import '../models/milk_menu.dart';

// ignore: must_be_immutable
class OrderScreen extends StatelessWidget {
  static String id = 'OrderScreen';
  OrderScreen({super.key, this.type, this.appBarColor});
  String? type;
  Color? appBarColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Order',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
              width: double.infinity,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50, left: 50, top: 30, bottom: 20),
                    child: Image(
                      image: AssetImage(
                        drinkImage[BlocProvider.of<OrderCubit>(context).drink]!,
                      ),
                      fit: BoxFit.fill,
                      height: 160,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const OrderSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        BlocProvider.of<OrderCubit>(context).drink!,
                        style: const TextStyle(fontSize: 20),
                      ),
                      InputQty(
                        initVal: BlocProvider.of<OrderCubit>(context).quantity,
                        minVal: 0,
                        maxVal: double.infinity,
                        onQtyChanged: (value) {
                          BlocProvider.of<OrderCubit>(context)
                              .addQuantity(value.toInt());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const OrderSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Restretto',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(children: [
                        GestureDetector(
                            child: RestrettoComponenet(
                                quantity: 'One',
                                size: BlocProvider.of<OrderCubit>(context)
                                    .restretto),
                            onTap: () {
                              BlocProvider.of<OrderCubit>(context)
                                  .chooseRestretto('One');
                            }),
                        GestureDetector(
                            child: RestrettoComponenet(
                                quantity: 'Two',
                                size: BlocProvider.of<OrderCubit>(context)
                                    .restretto),
                            onTap: () {
                              BlocProvider.of<OrderCubit>(context)
                                  .chooseRestretto('Two');
                            }),
                      ])
                    ],
                  ),
                  const SizedBox(height: 15),
                  const OrderSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Onsite / Takeaway',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(children: [
                        GestureDetector(
                            child: BlocProvider.of<OrderCubit>(context).onSite
                                ? Image.asset('assets/images/onSite_chosen.png')
                                : Image.asset(
                                    'assets/images/onSite_unchosen.png'),
                            onTap: () => BlocProvider.of<OrderCubit>(context)
                                .chooseState(true)),
                        const SizedBox(width: 15),
                        GestureDetector(
                            child: BlocProvider.of<OrderCubit>(context).onSite
                                ? Image.asset(
                                    'assets/images/Takeaway_unchosen.png')
                                : Image.asset(
                                    'assets/images/Takeaway_chosen.png'),
                            onTap: () => BlocProvider.of<OrderCubit>(context)
                                .chooseState(false))
                      ])
                    ],
                  ),
                  const SizedBox(height: 15),
                  const OrderSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Volume , ml',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          //size 250
                          GestureDetector(
                              child: (BlocProvider.of<OrderCubit>(context)
                                          .volume ==
                                      'small')
                                  ? Column(children: [
                                      Image.asset(
                                          'assets/images/250_chosen.png',
                                          height: 40),
                                      const Text('250',
                                          style: TextStyle(color: Colors.black))
                                    ])
                                  : Column(children: [
                                      Image.asset(
                                          'assets/images/250_unchosen.png',
                                          height: 40),
                                      const Text('250',
                                          style: TextStyle(color: Colors.grey))
                                    ]),
                              onTap: () => BlocProvider.of<OrderCubit>(context)
                                  .chooseVolume('small')),
                          const SizedBox(width: 15),
                          GestureDetector(
                              child: (BlocProvider.of<OrderCubit>(context)
                                          .volume ==
                                      'medium')
                                  ? Column(children: [
                                      Image.asset(
                                          'assets/images/350_chosen.png',
                                          height: 40),
                                      const Text('350',
                                          style: TextStyle(color: Colors.black))
                                    ])
                                  : Column(children: [
                                      Image.asset(
                                          'assets/images/350_unchosen.png',
                                          height: 40),
                                      const Text('350',
                                          style: TextStyle(color: Colors.grey))
                                    ]),
                              onTap: () => BlocProvider.of<OrderCubit>(context)
                                  .chooseVolume('medium')),
                          const SizedBox(width: 15),
                          GestureDetector(
                              child: (BlocProvider.of<OrderCubit>(context)
                                          .volume ==
                                      'large')
                                  ? Column(children: [
                                      Image.asset(
                                          'assets/images/450_chosen.png',
                                          height: 40),
                                      const Text('450',
                                          style: TextStyle(color: Colors.black))
                                    ])
                                  : Column(children: [
                                      Image.asset(
                                          'assets/images/450_unchosen.png',
                                          height: 40),
                                      const Text('450',
                                          style: TextStyle(color: Colors.grey))
                                    ]),
                              onTap: () => BlocProvider.of<OrderCubit>(context)
                                  .chooseVolume('large')),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const OrderSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Prepare by a certain time today?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      CupertinoSwitch(
                        value: BlocProvider.of<OrderCubit>(context).certainTime,
                        onChanged: (bool value) {
                          BlocProvider.of<OrderCubit>(context)
                              .chooseTime(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFFDE9ED8),
                          Color(0xFFD396E4),
                          Color(0xFFCC92EA),
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/option_icon.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                          Text(
                            'Coffee lover assemblage',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, DesignerScreen.id),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextOption('Total Amount', mainColor),
                      TextOption('EGP 9.50', mainColor)
                    ],
                  ),
                  Container(
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
                ],
              ),
            ),
            if (type != null)
              GestureDetector(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            if (type != null && type == 'Milk') const MilkSyrupMenu('Milk'),
            if (type != null && type == 'Syrup') const MilkSyrupMenu('Syrup')
          ],
        ),
      );
    });
  }
}
