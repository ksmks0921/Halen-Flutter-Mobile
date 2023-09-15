import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/utils/uuid_generator.dart';

// will probably be api call later for flexible pricing
double getDeliveryFeeForOrder() {
  return 5.99;
}

// current eat order state provider
final eatOrderProv =
    StateNotifierProvider<EatOrderNotifier, List<EatOrder>>((ref) {
  return EatOrderNotifier(ref, initialVal: []);
});

class EatOrderNotifier extends StateNotifier<List<EatOrder>> {
  EatOrderNotifier(this.ref, {required List<EatOrder> initialVal})
      : super(initialVal);

  final StateNotifierProviderRef<EatOrderNotifier, List<EatOrder>> ref;

  void clearCart() {
    state = [];
    updateProductCount();
  }

  void removeOrderItem(int orderIndex, int orderItemIndex) {
    List<EatOrder> newState = state;

    // if item is last item for order, remove order
    if (newState[orderIndex].items.length == 1) {
      newState.removeAt(orderIndex);
    } else {
      newState[orderIndex].items.removeAt(orderItemIndex);
    }
    state = [...newState];
    updateProductCount();
  }

  void updateOrderItemQuantity(
      int orderIndex, int orderItemIndex, int newQuant) {
    EatOrder oldOrder = state[orderIndex];
    EatProduct oldOrderItem =
        state[orderIndex].items[orderItemIndex] as EatProduct;
    oldOrderItem.quantity = newQuant;
    // for naming clarity
    EatOrder newOrder = oldOrder;

    List<EatOrder> ns = state;
    ns[orderIndex] = newOrder;
    state = [...ns];
    updateProductCount();
  }

  void addItemToOrder(EatProduct newItem, EatVendor newItemVendor) {
    List<EatOrder> curOrders =
        List.from(state.map((EatOrder order) => order.copyWith()).toList());

    String uidhc = gUID();
    bool vendorOrderExists = false;
    int eoIdx = 0;

    for (EatOrder eo in curOrders) {
      if (eo.vendor.id == newItemVendor.id) {
        vendorOrderExists = true;

        double newSubTotal = eo.orderData.subtotal + newItem.price;

        EatOrder newOrder = EatOrder(
            items: [newItem, ...eo.items],
            vendor: eo.vendor,
            orderData: EatOrderData(
                date: DateTime.now().toString(),
                id: uidhc,
                subtotal: newSubTotal,
                deliveryFee: eo.orderData.deliveryFee,
                total: newSubTotal + eo.orderData.deliveryFee));

        curOrders[eoIdx] = newOrder;
      }
      eoIdx += 1;
    }
    state = [...curOrders];

    if (vendorOrderExists == false) {
      double deliveryFee = getDeliveryFeeForOrder();
      double newSubTotal = (newItem.price + deliveryFee);

      EatOrder newOrder = EatOrder(
          items: [newItem],
          vendor: newItemVendor,
          orderData: EatOrderData(
              date: DateTime.now().toString(),
              id: uidhc,
              subtotal: newSubTotal,
              deliveryFee: deliveryFee,
              total: newSubTotal + deliveryFee));

      state = [newOrder, ...state];
    }
    updateProductCount();
  }

  int updateProductCount() {
    int count = 0;
    for (EatOrder order in state) {
      List<EatProduct> prodList = order.items.cast<EatProduct>();
      for (EatProduct item in prodList) {
        count += item.quantity ?? 1;
      }
    }
    ref.read(cicProv.notifier).state = count;
    return count;
  }
}

// cart item count provieder
final cicProv = StateProvider<int>((ref) {
  return 0;
});
