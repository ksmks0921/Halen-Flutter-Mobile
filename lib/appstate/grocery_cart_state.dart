import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/utils/uuid_generator.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

// will probably be api call later for flexible pricing
double getDeliveryFeeForOrder() {
  return 5.99;
}

// current eat order state provider
final grocOrderProv =
    StateNotifierProvider<GroceryOrderNotifier, List<GroceryOrder>>((ref) {
  return GroceryOrderNotifier(ref, initialVal: []);
});

class GroceryOrderNotifier extends StateNotifier<List<GroceryOrder>> {
  GroceryOrderNotifier(this.ref, {required List<GroceryOrder> initialVal})
      : super(initialVal);

  final StateNotifierProviderRef<GroceryOrderNotifier, List<GroceryOrder>> ref;

  void clearCart() {
    state = [];
    updateProductCount();
  }

  int getGrocItemQuantity(GroceryProduct product) {
    int count = 0;
    for (GroceryOrder go in state) {
      for (GProduct gp in go.items) {
        // extra checks for demo data
        if (gp.id == product.id && gp.vendorId == product.vendorId) {
          count += gp.quantity ?? 1;
        }
      }
    }
    return count;
  }

  void removeOrderItem(int orderIndex, int orderItemIndex) {
    List<GroceryOrder> newState = state;

    // if item is last item for order, remove order
    if (newState[orderIndex].items.length == 1) {
      newState.removeAt(orderIndex);
    } else {
      newState[orderIndex].items.removeAt(orderItemIndex);
    }
    state = [...newState];
    updateProductCount();
  }

  void removeOrderItemById(String id) {
    List<GroceryOrder> newState = state;
    int orderIdx = 0;
    int foundOrderIdx = 0;
    int foundItemIdx = 0;
    for (GroceryOrder go in newState) {
      int itemIdx = 0;
      for (GProduct item in go.items) {
        if (item.id == id) {
          foundItemIdx = itemIdx;
          foundOrderIdx = orderIdx;
        }
        itemIdx += 1;
      }
      orderIdx += 1;
    }
    newState[foundOrderIdx].items.removeAt(foundItemIdx);
    state = [...newState];
    updateProductCount();
  }

  void updateOrderItemQuantity(
      int orderIndex, int orderItemIndex, int newQuant) {
    GroceryOrder oldOrder = state[orderIndex];
    GroceryProduct oldOrderItem =
        state[orderIndex].items[orderItemIndex] as GroceryProduct;
    oldOrderItem.quantity = newQuant;
    // for naming clarity
    GroceryOrder newOrder = oldOrder;

    List<GroceryOrder> ns = state;
    ns[orderIndex] = newOrder;
    state = [...ns];
    updateProductCount();
  }

  void updateOrderItemQuantityById(String id, int newQuant) {
    if (newQuant == 0) {
      removeOrderItemById(id);
    } else {
      List<GroceryOrder> oldState = state;
      GProduct? foundItem;
      int orderIdx = 0;
      int foundOrderIdx = 0;
      int foundItemIdx = 0;
      for (GroceryOrder go in oldState) {
        int itemIdx = 0;
        for (GProduct item in go.items) {
          if (item.id == id) {
            foundItem = item;
            foundItemIdx = itemIdx;
            foundOrderIdx = orderIdx;
          }
          itemIdx += 1;
        }
        orderIdx += 1;
      }
      if (foundItem != null) {
        foundItem.quantity = newQuant;
        List<GroceryOrder> newState =
            // oldState.map((GroceryOrder order) => order.copyWith()).toList();
            oldState;
        if (newQuant > 0) {
          newState[foundOrderIdx].items[foundItemIdx] = foundItem;
        }
        state = [...newState];
        updateProductCount();
      } else {
        return;
      }
    }
  }

  void addItemToOrder(GroceryProduct newItem, GroceryVendor newItemVendor) {
    List<GroceryOrder> curOrders =
        List.from(state.map((GroceryOrder order) => order.copyWith()).toList());

    String uidhc = gUID();
    bool vendorOrderExists = false;
    int eoIdx = 0;

    for (GroceryOrder eo in curOrders) {
      if (eo.vendor.id == newItemVendor.id) {
        vendorOrderExists = true;
        double newSubTotal =
            eo.orderData.subtotal + (newItem.price * newItem.quantity!);

        bool giExists = false;
        int eoiIdx = 0;
        int eoiExistIdx = 0;
        for (GProduct item in eo.items) {
          if (item.id == newItem.id) {
            giExists = true;
            eoiExistIdx = eoiIdx;
            newItem.quantity = item.quantity! + newItem.quantity!;
          }
          eoiIdx += 1;
        }
        if (giExists == true) {
          eo.items.removeAt(eoiExistIdx);
        }

        GroceryOrder newOrder = GroceryOrder(
            items: [newItem, ...eo.items],
            vendor: eo.vendor,
            orderData: GroceryOrderData(
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

      GroceryOrder newOrder = GroceryOrder(
          items: [newItem],
          vendor: newItemVendor,
          orderData: GroceryOrderData(
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
    for (GroceryOrder order in state) {
      List<GroceryProduct> prodList = order.items.cast<GroceryProduct>();
      for (GroceryProduct item in prodList) {
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
