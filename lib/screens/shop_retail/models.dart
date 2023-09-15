import 'package:flutter/cupertino.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:halen_customer_app/models/order_model_generic.dart';

class Category {
  final String icon;
  final Color iconColor;
  final String name;

  Category({
    required this.icon,
    required this.iconColor,
    required this.name,
  });
}

class ShopProduct extends GProduct {
  ShopProduct(
      {required super.categoryId,
      required super.productName,
      required super.price,
      required super.imageUrl,
      required super.vendorId,
      required super.sizes,
      super.selectedSize,
      super.similars,
      super.customizations,
      super.categories,
      super.quantity,
      super.markPrice,
      required super.desc,
      required super.id,
      super.rating,
      super.brand,
      super.colors,
      super.selectedColor});

  ShopProduct copyWith({
    String? productName,
    double? price,
    String? imageUrl,
    String? vendorId,
    String? categoryId,
    int? quantity,
    double? markPrice,
    List? categories,
    List? sizes,
    int? selectedSize,
    List? similars,
    List? customizations,
    String? desc,
    String? id,
    double? rating,
    String? brand,
    List? colors,
    int? selectedColor,
  }) {
    return ShopProduct(
        productName: productName ?? super.productName,
        price: price ?? super.price,
        imageUrl: imageUrl ?? super.imageUrl,
        vendorId: vendorId ?? super.vendorId,
        categoryId: categoryId ?? super.categoryId,
        quantity: quantity ?? super.quantity,
        markPrice: markPrice ?? super.markPrice,
        categories: categories ?? super.categories,
        sizes: sizes ?? super.sizes,
        desc: desc ?? super.desc,
        id: id ?? super.id,
        rating: rating ?? super.rating,
        brand: brand ?? super.brand,
        colors: colors ?? super.colors,
        selectedColor: selectedColor ?? super.selectedColor,
        selectedSize: selectedSize ?? super.selectedSize,
        similars: similars ?? super.similars,
        customizations: customizations ?? super.customizations);
  }
}

class ShopProductPerCategory {
  final String categoryId;
  final String categoryName;
  final List<ShopProduct> products;

  ShopProductPerCategory({
    required this.categoryId,
    required this.categoryName,
    required this.products,
  });
}

class ShopVendor extends GVendor {
  // final String icon;

  ShopVendor(
      {required super.id,
      required super.name,
      required super.image,
      required super.products,
      super.addressShort,
      super.estDeliveryTimeMinutes,
      super.estShippingTimeDays,
      // required this.icon,
      super.rating,
      super.deliveryFee,
      super.distanceStr,
      super.reviewCountStr});
}

class ShopOrder extends GOrder {
  // final ShopVendor vendor;
  // final List<ShopProduct> items;
  // final ShopOrderData orderData;

  ShopOrder(
      {required super.vendor, required super.items, required super.orderData});

  ShopOrder copyWith(
      {ShopVendor? vendor,
      List<ShopProduct>? items,
      ShopOrderData? orderData}) {
    return ShopOrder(
      vendor: vendor ?? this.vendor,
      items: items ?? this.items,
      orderData: orderData ?? this.orderData,
    );
  }
}

class ShopOrderData extends GOrderData {
  // final String date;
  // final String id;
  // final double subtotal;
  // final double deliveryFee;
  // final double total;

  ShopOrderData(
      {required super.date,
      required super.id,
      required super.subtotal,
      required super.deliveryFee,
      required super.total});
}
