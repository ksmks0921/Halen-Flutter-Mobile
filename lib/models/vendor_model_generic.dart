import 'package:halen_customer_app/models/product_model_generic.dart';

class GVendor {
  final String id;
  final String name;
  final String image;
  final List<GProduct> products;

  //optional
  final List<String>? categories;
  final String? distanceStr;
  final String? addressShort;
  final String? shortDesc;
  final double? rating;
  final int? reviewCount;
  final double? deliveryFee;
  final String? deliveryTimeStr;
  final int? estDeliveryTime;
  final int? estDeliveryTimeMinutes;
  final int? estShippingTimeDays;
  final String? reviewCountStr;

  GVendor(
      {required this.id,
      required this.name,
      required this.image,
      required this.products,
      this.shortDesc,
      this.distanceStr,
      this.deliveryTimeStr,
      this.rating,
      this.reviewCount,
      this.addressShort,
      this.categories,
      // food estimate
      this.estDeliveryTime,
      // retail or shop estimates
      this.estDeliveryTimeMinutes,
      this.estShippingTimeDays,
      this.reviewCountStr,
      this.deliveryFee});
}
