import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Additive%20Cubit/additive_state.dart';

class AdditiveCubit extends Cubit<AdditiveState> {
  AdditiveCubit() : super(AdditiveInitial());
  List<String> additives = [];

  void addAdditive(String value) {
    bool found = false;
    for (String i in additives) {
      if (i == value) {
        additives.remove(value);
        found = true;
        break;
      }
    }
    if (!found) {
      additives.add(value);
    }
    emit(AdditiveSuccess());
  }

  bool selected(String value) {
    for (String i in additives) {
      if (i == value) {
        return true;
      }
    }
    return false;
  }

  void reset() {
    additives.clear();
  }
}
