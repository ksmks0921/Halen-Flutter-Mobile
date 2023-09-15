import 'package:flutter/material.dart';
import 'package:halen_customer_app/models/order_model_generic.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';

class EatOrder extends GOrder {
  // final EatVendor vendor;
  // final List<EatProduct> items;
  // final EatOrderData orderData;

  EatOrder(
      {required super.vendor, required super.items, required super.orderData});

  EatOrder copyWith(
      {EatVendor? vendor, List<EatProduct>? items, EatOrderData? orderData}) {
    return EatOrder(
      vendor: vendor ?? this.vendor,
      items: items ?? this.items,
      orderData: orderData ?? this.orderData,
    );
  }
}

class EatOrderData extends GOrderData {
  // final String date;
  // final String id;
  // final double subtotal;
  // final double deliveryFee;
  // final double total;

  EatOrderData(
      {required super.date,
      required super.id,
      required super.subtotal,
      required super.deliveryFee,
      required super.total});
}

class EatVendorPerCategory {
  final String categoryId;
  final String categoryName;
  final List<EatVendor> vendors;

  EatVendorPerCategory({
    required this.categoryId,
    required this.categoryName,
    required this.vendors,
  });
}

class EatProduct extends GProduct {
  // String? productName;
  // double? price;
  // String? imageUrl;
  // String? desc;
  // String? id;
  // int? quantity;
  // List? categories;
  // String? ingredients;
  // List? sizes;
  // int? selectedSize;
  // List? similars;
  // List<EatProductCustomization>? customizations;

  EatProduct({
    required super.productName,
    required super.price,
    required super.imageUrl,
    required super.desc,
    required super.id,
    required super.vendorId,
    super.quantity,
    super.customizations,
    super.categories,
    super.ingredients,
    required super.sizes,
    super.selectedSize,
    super.similars,
  });

  static copy(EatProduct old) {
    return EatProduct(
        productName: old.productName,
        price: old.price,
        imageUrl: old.imageUrl,
        desc: old.desc,
        id: old.id,
        vendorId: old.vendorId,
        quantity: old.quantity,
        customizations: old.customizations,
        categories: old.categories,
        ingredients: old.ingredients,
        sizes: old.sizes,
        selectedSize: old.selectedSize,
        similars: old.similars);
  }
}

class EatProductCustomizationItem {
  final String name;
  final double price;
  EatProductCustomizationItem({required this.name, required this.price});
}

class EatProductCustomization {
  final bool required;
  final String name;
  final List<EatProductCustomizationItem> items;
  // order can have several of this customization
  final bool multiple;
  // only one of the items can be chosen
  final bool exclusive;
  EatProductCustomization(
      {required this.required,
      required this.name,
      required this.items,
      required this.multiple,
      required this.exclusive});
}

class EatVendor extends GVendor {
  // final List<String> categories;
  // final String id;
  // final String name;
  // final String addressShort;
  // final String image;
  // final String shortDesc;
  // final double rating;
  // final int reviewCount;
  // final List<EatProduct> products;

  EatVendor(
      {required super.categories,
      required super.id,
      required super.name,
      required super.addressShort,
      required super.image,
      required super.shortDesc,
      required super.rating,
      required super.deliveryFee,
      required super.reviewCount,
      required super.products});
}

class EatCategory {
  final String icon;
  final Color iconColor;
  final String name;

  EatCategory({
    required this.icon,
    required this.iconColor,
    required this.name,
  });
}

Map<String, String> dispDataCat = {
  "all": 'All',
  "featured": "Featured",
  "appetizer": 'Appetizers',
  "pasta": "Pasta",
  "soup_and_salad": 'Salads & Soup',
  "vegetarian": 'Vegetarian',
  "snack": 'Snacks',
  "burger": 'Burger',
  "entree": 'Entree',
  "salad": "Salad",
  "sushi": "Sushi"
};
