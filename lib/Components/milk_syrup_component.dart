import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Designer%20Cubit/designer_cubit.dart';
import 'package:magic_coffee/constants.dart';

class MilkSyrupSelection extends StatelessWidget {
  const MilkSyrupSelection(this.name, this.type, {super.key});
  final String name;
  final String type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(name,
              style: TextStyle(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ),
        onTap: () {
          (type == 'Milk')
              ? BlocProvider.of<DesignerCubit>(context).milk = name
              : BlocProvider.of<DesignerCubit>(context).syrup = name;
          Navigator.pop(context);
        });
  }
}
