import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());
  String? country;
  void selectCountry(String value) {
    country = value;
    emit(CountrySuccess());
  }

  void reset() {
    country = null;
  }
}
