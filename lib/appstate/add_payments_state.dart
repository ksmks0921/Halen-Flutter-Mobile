// Model TBD
// {"type": "visa",
// "icon": "assets/images/icons/visa@2x (2).png",
// "display_number": "**** **** **** ${cardNumberController3.text
// "balance": "null"
// "auto-refill": "false"
// }"}

// halen card
// {"balance": "0.0", "auto_refill": ""}
import 'package:riverpod/riverpod.dart';

final hcProv = StateProvider<Map>((ref) {
  return {"balance": "0.0"};
});

//payment methods
final pmProv = StateNotifierProvider<PMNotifier, List<Map>>((ref) {
  return PMNotifier(initialVal: [
    {"type": "applePay", "icon": "assets/images/icons/apple_pay_icon1.png"}
  ]);
});

class PMNotifier extends StateNotifier<List<Map>> {
  PMNotifier({required List<Map> initialVal}) : super(initialVal);

  void addPM(Map pm) {
    state = [...state, pm];
  }

  void setPM(List<Map> newpm) {
    state = newpm;
  }
}

// selected payment method, list index in pmProv
final spProv = StateProvider<int>((ref) {
  return 0;
});

// selected card design
final scdProv = StateProvider<int>((ref) {
  return 0;
});
