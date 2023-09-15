import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/models/order_model_generic.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

double calcOrderSubtotal(
  List<GOrder> sOrder,
) {
  double calcSubTotal = 0;

  // add base price with and customizations multiplied by quantity
  for (GOrder so in sOrder) {
    for (GProduct gp in so.items) {
      calcSubTotal += (gp.price * (gp.quantity ?? 1));

      if (gp is EatProduct) {
        for (EatProductCustomization epc in gp.customizations!) {
          for (EatProductCustomizationItem epci in epc.items) {
            calcSubTotal += (epci.price * (gp.quantity ?? 1));
          }
        }
      }
    }
  }

  return calcSubTotal;
}

// calculate delivery fee for multiple deliveries ( fee per EatOrder which is per vendor )
double calcDeliveryFeeForOrder(List<GOrder> sEatOrder) {
  double calcDeliveryTotal = 0;
  for (GOrder eo in sEatOrder) {
    calcDeliveryTotal += eo.orderData.deliveryFee;
  }

  return calcDeliveryTotal;
}
