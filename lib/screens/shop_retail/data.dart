import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

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

List<Category> categoriesData = [
  Category(
    icon: "assets/images/shop/GIFTING.png",
    iconColor: Colors.blue,
    name: 'Gifting',
  ),
  Category(
    icon: "assets/images/shop/MEN.png",
    iconColor: Colors.red,
    name: 'Men',
  ),
  Category(
    icon: "assets/images/shop/WOMEN.png",
    iconColor: Colors.red,
    name: 'Women',
  ),
  Category(
    icon: "assets/images/shop/KIDS.png",
    iconColor: Colors.red,
    name: 'Kids',
  ),
  Category(
    icon: "assets/images/shop/BEAUTY.png",
    iconColor: Colors.red,
    name: 'Beauty',
  ),
  Category(
    icon: 'assets/images/shop/SPORTS.png',
    iconColor: Colors.red,
    name: 'Sports',
  ),
  // Add more categories as needed
];

List<ShopProduct> shopProductsData = [
  ShopProduct(
    id: "21",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Fur Coat Hooded",
    brand: "Especial",
    markPrice: 160,
    price: 120,
    rating: 4.9,
    sizes: ["S", "M", "L"],
    imageUrl: "assets/images/shop/faux_fur_hooded.png",
    colors: ["Black", "Brown", "Beige", "White"],
    desc: "Faux-Fur Trim Hooded Down Coat",
  ),
  ShopProduct(
    id: "22",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Double Breasted Coat",
    brand: "Rasterson",
    markPrice: 160,
    price: 120,
    rating: 4.7,
    sizes: ["S", "M", "L", "XL", "2XL"],
    colors: ["Black", "Navy Blue"],
    imageUrl: "assets/images/shop/double_breasted_blazer.png",
    desc: "Double breasted sport coat sailors edition",
  ),
  ShopProduct(
    id: "23",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Grey Diamond Shirt",
    brand: "M Co",
    markPrice: 145,
    price: 120,
    rating: 5.0,
    sizes: ["S", "M", "L", "XL", "2XL", "3XL"],
    // colors: ["Black", "Brown", "Navy Blue", "Beige"],
    imageUrl: "assets/images/shop/grey_collared.png",
    desc: "Grey Diamond pattern professional shirt",
  ),
  ShopProduct(
    id: "24",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Frilled Pant",
    brand: "Beyond beyond",
    markPrice: 145,
    price: 120,
    rating: 4.8,
    sizes: ["4", "6", "8", "10", "!2", "14", "16", "!8", "20"],
    colors: ["Black", "Brown", "Navy Blue", "White"],
    imageUrl: "assets/images/shop/ruffle_pant.png",
    desc: "Flowing loose free light pizazz pant",
  ),
  ShopProduct(
    id: "25",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Sport Blazer",
    brand: "Ovirion",
    markPrice: 120,
    price: 110,
    rating: 4.7,
    sizes: ["S", "M", "L", "XL"],
    colors: ["Black", "Grey", "Brown"],
    imageUrl: "assets/images/shop/orvis_sport_coat.png",
    desc: "Loose fit sport coat with high quality lining",
  ),
  ShopProduct(
    id: "26",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Michael Kors",
    brand: "Michael Kors",
    markPrice: 120,
    price: 110,
    rating: 4.7,
    sizes: ["S", "M", "L", "XL"],
    colors: ["Black", "Light Blue", "Navy Blue", "Pink", "White"],
    imageUrl: "assets/images/shop/woman_cloth_sample.jpeg",
    desc: "Sport Tank",
  ),
  ShopProduct(
    id: "27",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Vsport V Tank",
    brand: "Vsport",
    markPrice: 60,
    price: 40,
    rating: 4.9,
    sizes: ["S", "M", "L", "XL", "2XL", "3XL"],
    colors: ["Black", "Brown", "Navy Blue", "Beige"],
    imageUrl: "assets/images/shop/woman_cloth_sample_t.jpeg",
    desc: "Victory sport v cut tank top womens for casual or sport wear",
  ),
  ShopProduct(
    id: "28",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Cable knit vest",
    brand: "Mark Hansen",
    markPrice: 95,
    price: 65,
    rating: 4.8,
    sizes: ["S", "M", "L", "XL", "2XL"],
    colors: ["Black", "Brown", "Dark Grey", "Light Grey" "Tan"],
    imageUrl: "assets/images/shop/cable_knit_1.png",
    desc: "Cable knit snug vest with custom pattern",
  ),
];

List<ShopProductPerCategory> productsCategoriesDataAllRetail = [
  ShopProductPerCategory(
      categoryId: "gifting",
      categoryName: "Gifting",
      products: shopProductsData),
  ShopProductPerCategory(
      categoryId: "men", categoryName: "Men", products: shopProductsData),
  ShopProductPerCategory(
      categoryId: "women", categoryName: "Women", products: shopProductsData),
  ShopProductPerCategory(
      categoryId: "kids", categoryName: "Kids", products: shopProductsData),
  ShopProductPerCategory(
      categoryId: "beauty", categoryName: "Beauty", products: shopProductsData),
  ShopProductPerCategory(
      categoryId: "sports", categoryName: "Sports", products: shopProductsData),
];

ShopProductPerCategory relatedProduct = ShopProductPerCategory(
    categoryId: "related_products",
    categoryName: "Related Products",
    products: shopProductsData);

// final List<String> subCategoriesRetail = [
//   'All',
//   'Coats',
//   'Denims',
//   'Sweaters',
//   'Shirts',
//   'Gloves',
//   'Pants'
// ];

List categoryButtonList = [
  CategoryButton(
    name: "RIDE",
    description:
        'Select the vehicle size and price that fits your comfort level.',
    image: 'assets/images/illustrations/Ride.png',
  ),
  CategoryButton(
    name: "EAT",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Eat.png',
  ),
  CategoryButton(
    name: "GROCERY",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Grocery.png',
  ),
  CategoryButton(
    name: "SHOPPING",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Shopping.png',
  ),
];

getOrderDetailString(GProduct product) {
  String builtProdColorSizeString = "";
  if (product.selectedSize != null && product.sizes != null) {
    builtProdColorSizeString += product.sizes![product.selectedSize!];
  }
  if (product.colors != null && product.selectedColor != null) {
    builtProdColorSizeString += " ${product.colors![product.selectedColor!]}";
  }
  return builtProdColorSizeString;
}

List<ShopVendor> shoppingStoreData = [
  ShopVendor(
    id: "1",
    image: 'assets/images/grocery/store_target.png',
    name: 'Target',
    addressShort: "48 East st",
    deliveryFee: 7.99,
    products: shopProductsData,
    distanceStr: "2.3 mi",
    estDeliveryTimeMinutes: 360,
    reviewCountStr: "22k",
    rating: 4.4,
  ),
  ShopVendor(
    id: "2",
    image: 'assets/images/grocery/store_macy.png',
    name: 'Macy\'s',
    addressShort: "484 North dr",
    deliveryFee: 5.99,
    products: shopProductsData,
    distanceStr: "5.5 mi",
    estShippingTimeDays: 3,
    reviewCountStr: "44k",
    rating: 4.8,
  ),
  ShopVendor(
    id: "3",
    image: 'assets/images/grocery/store_nordstorm.png',
    name: 'Nordstorm',
    addressShort: "58 Town Center",
    deliveryFee: 5.99,
    products: shopProductsData,
    distanceStr: "5.5 mi",
    estShippingTimeDays: 3,
    reviewCountStr: "12k",
    rating: 4.6,
  ),
  ShopVendor(
    id: "4",
    image: 'assets/images/grocery/store_bedBath.png',
    name: 'Bed Bath & Beyond',
    addressShort: "99 Green Park",
    deliveryFee: 6.99,
    products: shopProductsData,
    distanceStr: "8.8 mi",
    estShippingTimeDays: 5,
    reviewCountStr: "58k",
    rating: 4.5,
  ),
];
