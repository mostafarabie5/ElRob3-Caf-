import 'package:flutter_bloc/flutter_bloc.dart';

import 'coffee_sort_state.dart';

class CoffeeSortCubit extends Cubit<CoffeeSortState> {
  CoffeeSortCubit() : super(CoffeeSortInitial());
  String? sort;
  void selectSort(String value) {
    if (sort == value) {
      sort = null;
    } else {
      sort = value;
    }
    emit(CoffeeSortSuccess());
  }

  void reset() {
    sort = null;
  }
}
