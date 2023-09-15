import 'package:flutter_riverpod/flutter_riverpod.dart';

// orders list cache same format as orders/data
final ordersProgProv = StateNotifierProvider<OrdersProgNotifier, List>((ref) {
  return OrdersProgNotifier(initialVal: []);
});

class OrdersProgNotifier extends StateNotifier<List> {
  OrdersProgNotifier({required List initialVal}) : super(initialVal);

  void addOrder(List od) {
    state.addAll(od);
  }

  void setOrder(List newod) {
    state = newod;
  }
}

// orders list cache same format as orders/data
final ordersHistProv = StateNotifierProvider<OrdersHistNotifier, List>((ref) {
  return OrdersHistNotifier(initialVal: []);
});

class OrdersHistNotifier extends StateNotifier<List> {
  OrdersHistNotifier({required List initialVal}) : super(initialVal);

  void addOrder(List od) {
    state.addAll(od);
  }

  void setOrder(List newod) {
    state = newod;
  }
}
