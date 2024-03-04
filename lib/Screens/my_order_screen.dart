import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:magic_coffee/constants.dart';
import '../Cubits/Order Cubit/order_cubit.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});
  static String id = 'MyOrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Text('My Order',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: ListView(
                children: [
                  Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.2,
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(15),
                          onPressed: (context) {},
                          icon: Icons.delete_outline_sharp,
                          foregroundColor: Colors.red,
                        ),
                      ],
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(drinkImage[
                                BlocProvider.of<OrderCubit>(context).drink]!),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    BlocProvider.of<OrderCubit>(context).drink!,
                                    style: TextStyle(color: mainColor)),
                                Row(
                                  children: [
                                    BlocProvider.of<OrderCubit>(context)
                                                .restretto ==
                                            'One'
                                        ? const Text('single')
                                        : const Text('double'),
                                    Text(
                                        ' | ${BlocProvider.of<OrderCubit>(context).volume}'),
                                  ],
                                ),
                                Text(
                                  'X ${BlocProvider.of<OrderCubit>(context).quantity}',
                                ),
                              ],
                            ),
                            Text(
                              'EGP \n 9.50 ',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      const Text('Total Price',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          )),
                      Text('EGP 9.50',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                    ]),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 40,
                        top: 15,
                        bottom: 15,
                      ),
                      width: 160,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            Text('Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ))
                          ]),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
