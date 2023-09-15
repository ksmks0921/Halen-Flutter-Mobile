import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:intl/intl.dart';

getEstDeliveryTimeByStr(GVendor vendor) {
  String deliveryTimeStr = "";
  if (vendor.estDeliveryTimeMinutes != null) {
    DateTime deliveryTime =
        DateTime.now().add(Duration(minutes: vendor.estDeliveryTimeMinutes!));
    String deliveryTimeHour = DateFormat.jm().format(deliveryTime).toString();

    deliveryTimeStr = "Delivery by $deliveryTimeHour";
  } else if (vendor.estShippingTimeDays != null) {
    DateTime deliveryTime =
        DateTime.now().add(Duration(days: vendor.estShippingTimeDays!));
    deliveryTimeStr = "Delivery by ${deliveryTime.month}/${deliveryTime.day}";
  } else if (vendor.deliveryTimeStr != null) {
    deliveryTimeStr = vendor.deliveryTimeStr!;
  }
  return deliveryTimeStr;
}
