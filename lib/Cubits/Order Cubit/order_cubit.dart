import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  String? drink;
  int quantity = 1;
  bool onSite = true;
  String volume = 'small';
  bool certainTime = false;
  String restretto = "single";

  OrderCubit() : super(OrderInitial());
  void addQuantity(int value) {
    quantity = value;
    emit(OrderSuccess());
  }

  void chooseRestretto(String value) {
    restretto = value;
    emit(OrderSuccess());
  }

  void chooseVolume(String value) {
    volume = value;
    emit(OrderSuccess());
  }

  void chooseState(bool value) {
    onSite = value;
    emit(OrderSuccess());
  }

  void chooseTime(bool value) {
    certainTime = value;
    emit(OrderSuccess());
  }

  void reset() {
    drink = null;
    quantity = 1;
    onSite = true;
    volume = 'small';
    certainTime = false;
    restretto = "single";
  }
}
