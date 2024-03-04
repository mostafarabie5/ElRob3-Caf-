import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Screens/coffee_sort_screen.dart';
import 'package:magic_coffee/constants.dart';
import 'package:magic_coffee/models/text_option.dart';

import '../Cubits/Country Cubit/country_cubit.dart';
import '../Cubits/Country Cubit/country_state.dart';

// ignore: must_be_immutable

class CountrySelection extends StatelessWidget {
  const CountrySelection(this.countryName, {super.key});
  final String countryName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (countryName == BlocProvider.of<CountryCubit>(context).country)
                    ? TextOption(countryName, Colors.blue)
                    : TextOption(countryName, mainColor),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, CoffeeSortScreen.id);
              BlocProvider.of<CountryCubit>(context).selectCountry(countryName);
            });
      },
    );
  }
}
