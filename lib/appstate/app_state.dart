import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/constants/constants.dart';

class CategoryStateNotifier extends StateNotifier<String> {
  CategoryStateNotifier() : super(Constants.categoryHome);

  void updateCategory(String newCategory) {
    state = newCategory;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryStateNotifier, String>((ref) {
  return CategoryStateNotifier();
});

// for offer banner
final offerShownProv = StateProvider<bool>((ref) {
  return true;
});
