import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:flutter/material.dart';

final List<String> subCategoriesGrocery = [
  'All',
  'Fruits',
  'Vegetables',
  'Dairy',
  'Specials',
  'Gloves',
  'Pants'
];

Map dispStrForCat = {
  "on_sale": "On Sale",
  "featured": "Featured",
  "popular": "Popular Item"
};

List<GroceryProduct> groceryProductsData0 = [
  GroceryProduct(
    id: "0",
    vendorId: "1",
    categoryId: "on_sale",
    productName: "Banana",
    desc: "Fresh and delicious",
    markPrice: 1.25,
    price: .89,
    imageUrl: "assets/images/grocery/banana_product.png",
  ),
  GroceryProduct(
    id: "1",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Campbell’s Chicken Noodle Soup",
    desc:
        "Every sip of this comforting chicken noodle soup is crafted with the simple, delicious ingredients you grew up on. The soul-warming flavors of premium chicken broth, carrots, enriched noodles and bites of tender chicken meat without antibiotics make this soup a delicious and nostalgic choice anytime, anywhere. ",
    markPrice: 4.99,
    price: 3.99,
    imageUrl: "assets/images/grocery/noodle.png",
  ),
  GroceryProduct(
    id: "2",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Pepper",
    desc:
        "Fresh from the farm, mild flavor and a crunchy texture, making it a popular addition to salads, sandwiches, and stir-fry dishes. Bell peppers are also a great source of vitamins C and A.",
    markPrice: 2.24,
    price: 1.58,
    imageUrl: "assets/images/grocery/pepper.png",
  ),
  GroceryProduct(
    id: "3",
    categoryId: "on_sale",
    vendorId: "1",
    productName: "Evaporated Milk",
    desc: "Nestle Carnation Evaporated Milk 354ml",
    markPrice: 3.99,
    price: 2.99,
    imageUrl: "assets/images/grocery/e_milk.png",
  ),
  GroceryProduct(
    id: "4",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Egg 12 ct.",
    desc:
        """When you crack open Happy Egg Free Range Large Brown Vitamin Plus Eggs, you can rest assured that you're getting a healthy breakfast with a boost. These Free Range eggs have more vitamin D*, B7*, and B9* compared to standard eggs**. Happy Egg Vitamin Plus eggs are laid by hens on small family farms where they can snack on bugs and grass to supplement their nutritious feed. Inside every brown shell egg, you'll find golden sunrise orange yolks that look and taste incredible.

    Plump, golden sunrise yolks and creamy egg whites, perfect for scrambled eggs
  Laid by Happy hens raised on Free Range farms
  Grade A large brown eggs with farm freshness you can taste
  *Disclaimer: Vitamin Plus Eggs contain 10x more Vitamin D and 2x more Vitamin B7 and B9 versus Standard Grade A Large Whole Eggs.

    **Standard large whole eggs as defined by the U.S. Department of Agriculture Research Service. Food Data Central, 2019. fdc.nal.usda.gov.""",
    markPrice: 6.99,
    price: 5.89,
    imageUrl: "assets/images/grocery/happy_egg.png",
  ),
];

List<GroceryProduct> groceryProductsData1 = [
  GroceryProduct(
    id: "5",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Orowheat wheat bread",
    desc:
        "Go ahead and live a heart-healthy lifestyle with a loaf of Nature's Own Life Sugar-Free 100% Whole Grain Bread Loaf. Each bread slice has 11 grams of whole grains per serving and is completely sugar free. Your family will also enjoy bread that is deliciously soft and fresh.",
    markPrice: 5.99,
    price: 4.99,
    imageUrl: "assets/images/grocery/orowheat.png",
  ),
  GroceryProduct(
    id: "6",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Corned Tuna",
    desc:
        "San Marino Corned Tuna has less oil and has lots of omega-3 which can only mean one thing- it’s good for you.",
    markPrice: 2.99,
    price: 1.58,
    imageUrl: "assets/images/grocery/sm_ctuna.png",
  ),
  GroceryProduct(
    id: "7",
    vendorId: "1",
    categoryId: "on_sale",
    productName: "Prince Mushrooms",
    desc:
        "100g Whole Mushrooms make a great addition to a variety of meals, but you can also enjoy them on their own.",
    markPrice: 4.55,
    price: 3.98,
    imageUrl: "assets/images/grocery/wp_mushrooms.png",
  ),
  GroceryProduct(
    id: "8",
    categoryId: "on_sale",
    vendorId: "1",
    productName: "Celery",
    desc: "Pascal Celery, organic",
    markPrice: 3.99,
    price: 2.99,
    imageUrl: "assets/images/grocery/noodle.png",
  ),
  GroceryProduct(
    id: "9",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "Pepper",
    desc:
        "Fresh from the farm, mild flavor and a crunchy texture, making it a popular addition to salads, sandwiches, and stir-fry dishes. Bell peppers are also a great source of vitamins C and A.",
    markPrice: 2.23,
    price: 1.58,
    imageUrl: "assets/images/grocery/pepper.png",
  ),
];

List<GroceryProduct> groceryProductsData2 = [
  GroceryProduct(
    id: "10",
    categoryId: "on_sale",
    vendorId: "1",
    productName: "Evaporated Milk",
    desc: "Nestle Carnation Evaporated Milk 354ml",
    markPrice: 3.99,
    price: 2.99,
    imageUrl: "assets/images/grocery/e_milk.png",
  ),
  GroceryProduct(
    id: "11",
    categoryId: "on_sale",
    vendorId: "2",
    productName: "SpinDrift",
    desc:
        "Treat yourself to a classic, tart flavor of Spindrift Lemon Sparkling Water. Made with just two real ingredients, fresh squeezed lemons and just the right amount of carbonated water, Spindrift Lemon tastes exactly as fresh and delicious as lemon water should. Spindrift is simple and real-unsweetened and free of any added flavors, essences, or additives and never contains anything artificial. Just real fruit and sparkling water. Spindrift can be enjoyed from a chilled can or as a delicious mixer.",
    unitQuantity: "12 Fl. Oz. Cans, 8 Count",
    markPrice: 5.99,
    price: 4.99,
    imageUrl: "assets/images/grocery/spindrift.png",
  ),
  GroceryProduct(
    id: "12",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Shredded Cheese Mexican Style Blend",
    desc: "8.0oz",
    unitQuantity: "8.0oz",
    markPrice: 4.00,
    price: 1.58,
    imageUrl: "assets/images/grocery/shredded_cheese.png",
  ),
  GroceryProduct(
    id: "13",
    vendorId: "1",
    categoryId: "on_sale",
    productName: "Orville Popcorn 24pk",
    desc:
        "made with no artificial preservatives, flavors or dyes because real, delicious popcorn can only be made with ingredients sourced from nature.",
    markPrice: 12.24,
    price: 10.22,
    unitQuantity: "24 x 3.29oz",
    imageUrl: "assets/images/grocery/popcorn.png",
  ),
  GroceryProduct(
    id: "14",
    categoryId: "on_sale",
    vendorId: "3",
    productName: "Corned Tuna",
    desc:
        "San Marino Corned Tuna has less oil and has lots of omega-3 which can only mean one thing- it’s good for you.",
    markPrice: 2.99,
    price: 1.58,
    imageUrl: "assets/images/grocery/sm_ctuna.png",
  ),
];

List<GroceryProduct> allGroceryProducts = [
  ...groceryProductsData0,
  ...groceryProductsData1,
  ...groceryProductsData2
];

List<GroceryVendor> groceryStoreData = [
  GroceryVendor(
      id: "0",
      image: 'assets/images/grocery/kroger.png',
      name: 'Kroger',
      addressShort: "123 Z ln",
      deliveryFee: 4.99,
      deliveryTimeStr: "2 hrs",
      distanceStr: "3.3 mi",
      rating: 4.8,
      products: groceryProductsData0),
  GroceryVendor(
      id: "5",
      image: 'assets/images/grocery/store_sprouts.png',
      name: 'Sprouts',
      addressShort: "4 South city way",
      deliveryFee: 5.99,
      distanceStr: "8.5 mi",
      deliveryTimeStr: "6 hrs",
      rating: 4.5,
      products: groceryProductsData2),
  GroceryVendor(
      id: "1",
      image: 'assets/images/grocery/store_giant.png',
      name: 'Giant',
      addressShort: "321 E dr",
      deliveryFee: 7.99,
      deliveryTimeStr: "4 hrs",
      distanceStr: "5.4 mi",
      rating: 4.7,
      products: groceryProductsData1),
  GroceryVendor(
      id: "2",
      image: 'assets/images/grocery/store_target.png',
      name: 'Target',
      addressShort: "444 S dr",
      deliveryFee: 4.99,
      deliveryTimeStr: "6 hrs",
      distanceStr: "6.4 mi",
      rating: 4.9,
      products: groceryProductsData2),
  GroceryVendor(
      id: "6",
      image: 'assets/images/grocery/store_wholeFoods.png',
      name: 'Whole Foods Market',
      addressShort: "4444 Center dr",
      deliveryFee: 4.45,
      distanceStr: "4.4 mi",
      deliveryTimeStr: "3 hrs",
      rating: 4.9,
      products: groceryProductsData1),
  GroceryVendor(
      id: "3",
      image: 'assets/images/grocery/store_albertsons.png',
      name: 'Albertsons',
      addressShort: "58 Infinite dr",
      deliveryFee: 5.99,
      distanceStr: "5.4 mi",
      deliveryTimeStr: "4 hrs",
      rating: 5.0,
      products: groceryProductsData0),
  GroceryVendor(
      id: "4",
      image: 'assets/images/grocery/store_safeway.png',
      name: 'Safeway',
      addressShort: "123 Left Lane rd",
      deliveryFee: 7.99,
      distanceStr: "5.4 mi",
      deliveryTimeStr: "4 hrs",
      rating: 4.4,
      products: groceryProductsData1),
];

List multipleGroceryProductsData = [
  groceryProductsData0,
  groceryProductsData1,
  groceryProductsData2,
  groceryProductsData0,
  groceryProductsData1,
  groceryProductsData2,
  groceryProductsData0,
];

List<Category> groceryCategoriesData = [
  Category(
    icon: "assets/images/grocery/category_all.png",
    iconColor: Colors.blue,
    name: 'Specials',
  ),
  Category(
    icon: "assets/images/grocery/category_vegetable.png",
    iconColor: Colors.red,
    name: 'Product',
  ),
  Category(
    icon: "assets/images/grocery/category_diary.png",
    iconColor: Colors.red,
    name: 'Diary',
  ),
  Category(
    icon: "assets/images/grocery/category_vegetable.png",
    iconColor: Colors.red,
    name: 'Vegetables',
  ),
  Category(
    icon: "assets/images/grocery/category_fruits.png",
    iconColor: Colors.red,
    name: 'Fruits',
  ),
  Category(
    icon: 'assets/images/grocery/category_all.png',
    iconColor: Colors.red,
    name: 'Munchies',
  ),
  // Add more categories as needed
];

List<GroceryProductPerCategory> groceryProductsCategoriesData = [
  GroceryProductPerCategory(
      categoryId: "specials",
      categoryName: "Specials",
      products: groceryProductsData0),
  GroceryProductPerCategory(
      categoryId: "product",
      categoryName: "Product",
      products: groceryProductsData1),
  GroceryProductPerCategory(
      categoryId: "dairy",
      categoryName: "Dairy",
      products: groceryProductsData2),
  GroceryProductPerCategory(
      categoryId: "vegetables",
      categoryName: "Vegetables",
      products: groceryProductsData0),
  GroceryProductPerCategory(
      categoryId: "fruits",
      categoryName: "Fruits",
      products: groceryProductsData1),
  GroceryProductPerCategory(
      categoryId: "munchies",
      categoryName: "Munchies",
      products: groceryProductsData2),
];
