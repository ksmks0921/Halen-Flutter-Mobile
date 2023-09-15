import 'package:flutter/material.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
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

class GroceryVendor extends GVendor {
  // final String icon;

  GroceryVendor(
      {required super.id,
      required super.name,
      required super.image,
      required super.products,
      super.addressShort,
      super.distanceStr,
      super.deliveryTimeStr,
      super.rating,
      // required this.icon,
      super.deliveryFee});
}

class GroceryProduct extends GProduct {
  GroceryProduct(
      {required super.categoryId,
      required super.productName,
      required super.price,
      required super.imageUrl,
      required super.vendorId,
      super.quantity,
      super.markPrice,
      required super.desc,
      required super.id,
      super.unitQuantity,
      super.weightOrDiscreteStr});

  GroceryProduct copyWith({
    String? categoryId,
    String? productName,
    double? price,
    String? imageUrl,
    String? vendorId,
    int? quantity,
    double? markPrice,
    String? desc,
    String? id,
    String? unitQuantity,
    String? weightOrDiscreteStr,
  }) {
    return GroceryProduct(
        categoryId: categoryId ?? super.categoryId,
        productName: productName ?? super.productName,
        price: price ?? super.price,
        imageUrl: imageUrl ?? super.imageUrl,
        vendorId: vendorId ?? super.vendorId,
        quantity: quantity ?? super.quantity,
        markPrice: markPrice ?? super.markPrice,
        desc: desc ?? super.desc,
        id: id ?? super.id,
        unitQuantity: unitQuantity ?? super.unitQuantity,
        weightOrDiscreteStr: weightOrDiscreteStr ?? super.weightOrDiscreteStr);
  }
}

class CategoryItem {
  String name;
  String description;
  String image;

  CategoryItem({
    required this.name,
    required this.description,
    required this.image,
  });
}

class CategoryButton {
  String name;
  String description;
  String image;

  CategoryButton({
    required this.name,
    required this.description,
    required this.image,
  });
}

class GroceryOrder extends GOrder {
  // final ShopVendor vendor;
  // final List<ShopProduct> items;
  // final ShopOrderData orderData;

  GroceryOrder(
      {required super.vendor, required super.items, required super.orderData});

  GroceryOrder copyWith(
      {GroceryVendor? vendor,
      List<GroceryProduct>? items,
      GroceryOrderData? orderData}) {
    return GroceryOrder(
      vendor: vendor ?? this.vendor,
      items: items ?? this.items,
      orderData: orderData ?? this.orderData,
    );
  }
}

class GroceryOrderData extends GOrderData {
  // final String date;
  // final String id;
  // final double subtotal;
  // final double deliveryFee;
  // final double total;

  GroceryOrderData(
      {required super.date,
      required super.id,
      required super.subtotal,
      required super.deliveryFee,
      required super.total});
}

class GroceryProductPerCategory {
  final String categoryId;
  final String categoryName;
  final List<GroceryProduct> products;

  GroceryProductPerCategory({
    required this.categoryId,
    required this.categoryName,
    required this.products,
  });
}

class Offer {
  String image;
  String headline;
  String subtitle;

  Offer({
    required this.image,
    required this.headline,
    required this.subtitle,
  });
}
