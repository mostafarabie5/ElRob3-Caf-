import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_coffee/Cubits/Designer%20Cubit/designer_state.dart';

class DesignerCubit extends Cubit<DesignerState> {
  DesignerCubit() : super(DesignerInitial());
  int percent = 0;
  int grinding = 1;
  String? milk;
  String? syrup;

  void chooseCoffeeType(int value) {
    percent = value;
    emit(DesignerSuccess());
  }

  void chooseGrinding(int value) {
    grinding = value;
    emit(DesignerSuccess());
  }

  void reset() {
    percent = 0;
    grinding = 1;
    milk = null;
    syrup = null;
  }
}
