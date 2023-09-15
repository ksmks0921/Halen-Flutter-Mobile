import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/utils/uuid_generator.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

// will probably be api call later for flexible pricing
double getDeliveryFeeForOrder() {
  return 5.99;
}

// current eat order state provider
final shopOrderProv =
    StateNotifierProvider<ShopOrderNotifier, List<ShopOrder>>((ref) {
  return ShopOrderNotifier(ref, initialVal: []);
});

class ShopOrderNotifier extends StateNotifier<List<ShopOrder>> {
  ShopOrderNotifier(this.ref, {required List<ShopOrder> initialVal})
      : super(initialVal);

  final StateNotifierProviderRef<ShopOrderNotifier, List<ShopOrder>> ref;

  void clearCart() {
    state = [];
    updateProductCount();
  }

  void removeOrderItem(int orderIndex, int orderItemIndex) {
    List<ShopOrder> newState = state;

    // if item is last item for order, remove order
    if (newState[orderIndex].items.length == 1) {
      newState.removeAt(orderIndex);
    } else {
      newState[orderIndex].items.removeAt(orderItemIndex);
    }
    state = [...newState];
    updateProductCount();
  }

  int getShopItemQuantity(ShopProduct product) {
    int count = 0;
    for (ShopOrder so in state) {
      for (GProduct gp in so.items) {
        // extra checks for demo data
        if (gp.id == product.id && gp.vendorId == product.vendorId) {
          count += gp.quantity ?? 1;
        }
      }
    }
    return count;
  }

  void updateOrderItemQuantity(
      int orderIndex, int orderItemIndex, int newQuant) {
    ShopOrder oldOrder = state[orderIndex];
    ShopProduct oldOrderItem =
        state[orderIndex].items[orderItemIndex] as ShopProduct;
    oldOrderItem.quantity = newQuant;
    // for naming clarity
    ShopOrder newOrder = oldOrder;

    List<ShopOrder> ns = state;
    ns[orderIndex] = newOrder;
    state = [...ns];
    updateProductCount();
  }

  void updateOrderItemQuantityById(String id, int newQuant) {
    List<ShopOrder> oldState = state;
    GProduct? foundItem;
    int orderIdx = 0;
    int foundOrderIdx = 0;
    int itemIdx = 0;
    int foundItemIdx = 0;
    for (ShopOrder go in oldState) {
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
    } else {
      return;
    }
    // for naming clarity
    List<ShopOrder> newState = oldState;
    newState[foundOrderIdx].items.removeAt(foundItemIdx);
    if (newQuant > 0) {
      newState[foundOrderIdx].items.add(foundItem);
    }
    state = [...newState];
    updateProductCount();
  }

  void addItemToOrder(ShopProduct newItem, ShopVendor newItemVendor) {
    List<ShopOrder> curOrders =
        List.from(state.map((ShopOrder order) => order.copyWith()).toList());

    String uidhc = gUID();
    bool vendorOrderExists = false;
    int soIdx = 0;

    for (ShopOrder so in curOrders) {
      if (so.vendor.id == newItemVendor.id) {
        vendorOrderExists = true;

        double newSubTotal =
            so.orderData.subtotal + (newItem.price * newItem.quantity!);

        bool siExists = false;
        int soiIdx = 0;
        int soiExistIdx = 0;
        for (GProduct item in so.items) {
          if (item.id == newItem.id) {
            if (item.selectedColor == newItem.selectedColor &&
                item.selectedSize == newItem.selectedSize) {
              siExists = true;
              soiExistIdx = soiIdx;
              newItem.quantity = item.quantity! + newItem.quantity!;
            }
            soiIdx += 1;
          }
        }
        if (siExists == true) {
          so.items.removeAt(soiExistIdx);
        }

        ShopOrder newOrder = ShopOrder(
            items: [newItem, ...so.items],
            vendor: so.vendor,
            orderData: ShopOrderData(
                date: DateTime.now().toString(),
                id: uidhc,
                subtotal: newSubTotal,
                deliveryFee: so.orderData.deliveryFee,
                total: newSubTotal + so.orderData.deliveryFee));

        curOrders[soIdx] = newOrder;
      }
      soIdx += 1;
      state = [...curOrders];
    }

    if (vendorOrderExists == false) {
      double deliveryFee = getDeliveryFeeForOrder();
      double newSubTotal = ((newItem.price * newItem.quantity!) + deliveryFee);

      ShopOrder newOrder = ShopOrder(
          items: [newItem],
          vendor: newItemVendor,
          orderData: ShopOrderData(
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
    for (ShopOrder order in state) {
      List<ShopProduct> prodList = order.items.cast<ShopProduct>();
      for (ShopProduct item in prodList) {
        count += item.quantity ?? 1;
      }
    }
    ref.read(cicProv.notifier).state = count;
    return count;
  }

  bool itemIsAddedToCart(String id) {
    bool addedToCart = false;
    for (ShopOrder order in state) {
      List<ShopProduct> prodList = order.items.cast<ShopProduct>();
      for (ShopProduct item in prodList) {
        if (item.id == id) {
          addedToCart = true;
        }
      }
    }
    return addedToCart;
  }
}

// cart item count provieder
final cicProv = StateProvider<int>((ref) {
  return 0;
});
