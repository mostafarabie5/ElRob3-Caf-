import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Additive%20Cubit/additive_cubit.dart';
import 'package:magic_coffee/Cubits/Additive%20Cubit/additive_state.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/text_option.dart';

// ignore: must_be_immutable

class AdditivesSelection extends StatelessWidget {
  const AdditivesSelection(this.additive, {super.key});
  final String additive;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditiveCubit, AdditiveState>(
      builder: (context, state) {
        return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (BlocProvider.of<AdditiveCubit>(context).selected(additive) ==
                        true)
                    ? TextOption(additive, Colors.blue)
                    : TextOption(additive, mainColor),
                (BlocProvider.of<AdditiveCubit>(context).selected(additive) ==
                        true)
                    ? const Icon(Icons.check, color: Colors.blue)
                    : Container(),
              ],
            ),
            onTap: () {
              BlocProvider.of<AdditiveCubit>(context).addAdditive(additive);
            });
      },
    );
  }
}
