import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';

class GOrder {
  final GVendor vendor;
  final List<GProduct> items;
  final GOrderData orderData;

  GOrder({required this.vendor, required this.items, required this.orderData});
}

class GOrderData {
  final String date;
  final String id;
  final double subtotal;
  final double deliveryFee;
  final double total;

  GOrderData(
      {required this.date,
      required this.id,
      required this.subtotal,
      required this.deliveryFee,
      required this.total});
}
