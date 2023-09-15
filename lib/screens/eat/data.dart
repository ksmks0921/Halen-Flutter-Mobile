import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/eat/models.dart';

// name is used to check required right now so
// could limit users to creating one named customization
// such as Select primary ingredient, select extra ingredients
// select cocktails, select sauce etc.
List<EatProductCustomization> eatProductCustomizationOptions = [
  EatProductCustomization(
      required: true,
      name: "Select Ingredients",
      items: [
        EatProductCustomizationItem(name: "Shrimp", price: 2.00),
        EatProductCustomizationItem(name: "Green Pepper", price: 2.00),
        EatProductCustomizationItem(name: "Onions", price: 2.00)
      ],
      multiple: false,
      exclusive: false),
  EatProductCustomization(
      required: false,
      name: "Add Beverage",
      items: [
        EatProductCustomizationItem(name: "Cola", price: 2.00),
        EatProductCustomizationItem(name: "Ice Tea", price: 2.00),
        EatProductCustomizationItem(name: "Mojito", price: 4.00)
      ],
      multiple: true,
      exclusive: true)
];

List<EatCategory> eatCategoriesData = [
  EatCategory(
    icon: "assets/images/eat/all_healthy.png",
    iconColor: Colors.white,
    name: 'All',
  ),
  EatCategory(
    icon: "assets/images/eat/korean.png",
    iconColor: Colors.white,
    name: 'Korean',
  ),
  EatCategory(
    icon: "assets/images/eat/indian.png",
    iconColor: Colors.white,
    name: 'Indian',
  ),
  EatCategory(
    icon: "assets/images/eat/mediterranean.png",
    iconColor: Colors.white,
    name: 'Mediterranean',
  ),
  EatCategory(
    icon: "assets/images/grocery/category_vegetable.png",
    iconColor: Colors.white,
    name: 'Vegetarian',
  ),
];

List<EatVendorPerCategory> eatCategoryVendorsData = [
  EatVendorPerCategory(
      categoryId: "free_delivery",
      categoryName: "Free Delivery",
      vendors: eatVendorsData0),
  EatVendorPerCategory(
      categoryId: "featured",
      categoryName: "Featured",
      vendors: eatVendorsData1),
  EatVendorPerCategory(
      categoryId: "best_value",
      categoryName: "Best Value",
      vendors: eatVendorsData2),
];

List<EatVendor> eatVendorsData0 = [
  EatVendor(
      id: "0",
      categories: ["featured", "free_delivery"],
      name: "Ristorante Grill & More",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/ristorante_italian.png",
      shortDesc: "American cuisine",
      rating: 4.9,
      reviewCount: 120,
      deliveryFee: 4.99,
      products: ristoranteEatProducts),
  EatVendor(
      id: "1",
      categories: ["free_delivery"],
      name: "Taste of Italy",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/ristorante_grill.png",
      shortDesc: "Italian, pasta, salads, soups",
      rating: 4.6,
      reviewCount: 120,
      deliveryFee: 5.99,
      products: italyEatProducts),
];

List<EatVendor> eatVendorsData1 = [
  EatVendor(
      id: "2",
      categories: ["featured"],
      name: "Sushi Supreme",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/sushi_rest.png",
      shortDesc: "Authentic japanese fresh sushi",
      rating: 4.8,
      reviewCount: 120,
      deliveryFee: 3.99,
      products: sushiEatProducts),
  EatVendor(
      id: "3",
      categories: ["featured"],
      name: "Atlantic Pointe",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/seafood_rest.png",
      shortDesc: "Fresh seafood caught daily",
      rating: 4.9,
      reviewCount: 120,
      deliveryFee: 4.99,
      products: seafoodEatProducts),
];

List<EatVendor> eatVendorsData2 = [
  EatVendor(
      id: "4",
      categories: ["best_value"],
      name: "Parisian",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/french_rest.png",
      shortDesc: "Frances finest dining",
      rating: 4.2,
      reviewCount: 120,
      deliveryFee: 3.99,
      products: frenchEatProducts),
  EatVendor(
      id: "5",
      categories: ["best_value"],
      name: "Green Park Restaurunt",
      addressShort: "5188 Downtown ln.",
      image: "assets/images/eat/gp_rest.png",
      shortDesc: "Classic vegetarian",
      rating: 4.7,
      reviewCount: 120,
      deliveryFee: 5.99,
      products: vegetarianEatProducts),
];

List<EatVendor> allEatVendors = [
  ...eatVendorsData0,
  ...eatVendorsData1,
  ...eatVendorsData2
];

// List<EatProduct> eatCartTestProducts = [
//   EatProduct(
//       id: "0",
//       categories: ["appetizer", "pasta"],
//       productName: "Shrimp Pasta",
//       desc: "Delicious Shrimp Pasta",
//       ingredients:
//           "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
//       price: 10,
//       imageUrl: "assets/images/eat/shrimp_pasta.png",
//       sizes: ["Bowl", "Plate"],
//       similars: ["1", "2"]),
//   EatProduct(
//       id: "2",
//       categories: ["appetizer"],
//       productName: "Cheese Bread",
//       desc: "Delicious cheese bread",
//       ingredients:
//           "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
//       price: 12,
//       imageUrl: "assets/images/eat/cheese_bread.png",
//       sizes: ["Regular", "Large"],
//       similars: ["1"]),
// ];

List<EatProduct> featuredVendorProducts0 = [
  EatProduct(
      id: "6",
      vendorId: "0",
      categories: ["featured"],
      productName: "Classic Chicken Cordon Blue",
      desc: "Delicious cordon blue",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 16,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["0", "3"]),
  EatProduct(
      id: "6",
      vendorId: "0",
      categories: ["featured"],
      productName: "Deluxe Chicken Soup",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Small", "Regular"],
      similars: ["0", "3"]),
  EatProduct(
      id: "1",
      vendorId: "0",
      categories: ["appetizer", "snack", "featured"],
      productName: "Pretzel Bites",
      desc: "Delicious pretzels",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 15,
      imageUrl: "assets/images/eat/pretzel_bites.png",
      sizes: ["Small", "Medium", "Large", "Extra Large"],
      similars: ["2"]),
  EatProduct(
      id: "2",
      vendorId: "0",
      categories: ["appetizer", "snack", "featured"],
      productName: "Cheese Bread",
      desc: "Delicious cheese bread",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/cheese_bread.png",
      sizes: ["Regular", "Large"],
      similars: ["1"]),
];

// italian
List<EatProduct> featuredVendorProducts1 = [
  EatProduct(
      id: "8",
      vendorId: "1",
      categories: ["appetizer"],
      productName: "Bruschetta",
      desc:
          "Grilled bread rubbed with garlic and topped with olive oil and salt.",
      ingredients: "Garlic, olive oil, salt, tomato, fresh basil, cream cheese",
      price: 11,
      imageUrl: "assets/images/eat/bruschetta.png",
      sizes: ["Regular"],
      similars: ["0", "3"]),
  EatProduct(
      id: "5",
      vendorId: "1",
      categories: ["pasta"],
      productName: "Shrimp Pasta",
      desc: "Delicious Shrimp Pasta",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 10,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["1", "2"]),
  EatProduct(
      id: "23",
      vendorId: "1",
      categories: ["seafood", "italian"],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
];
//sushi
List<EatProduct> featuredVendorProducts2 = [
  EatProduct(
      id: "11",
      vendorId: "2",
      categories: ["appetizer"],
      productName: "Takyoyaki",
      desc: "Octopus in light fried dough",
      ingredients: "Octopus in light fried dough",
      price: 14,
      imageUrl: "assets/images/eat/takyoyaki.png",
      sizes: ["Regular"],
      similars: ["9", "10"]),
  EatProduct(
      id: "11",
      vendorId: "2",
      categories: ["sushi"],
      productName: "Salmon Sushi",
      desc: "Salmon with rice",
      ingredients: "Salmon with rice",
      price: 12,
      imageUrl: "assets/images/eat/salmon_sushi.png",
      sizes: ["Regular"],
      similars: ["12", "13"]),
  EatProduct(
      id: "23",
      vendorId: "2",
      categories: [
        "seafood",
      ],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
];
//seafood
List<EatProduct> featuredVendorProducts3 = [
  EatProduct(
      id: "19",
      vendorId: "3",
      categories: ["pasta", "seafood"],
      productName: "Black Shrimp Pasta",
      desc: "Black Shrimp Pasta",
      ingredients:
          "BLACK TIGER SHRIMP, ANDOUILLE SAUSAGE, MUSSELS, PEPPERS, ONIONS, CAJUN CREAMY TOMATO SAUCE, PARMESAN, BAGUETTE",
      price: 22,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Regular"],
      similars: ["16"]),
  EatProduct(
      id: "14",
      vendorId: "3",
      categories: ["appetizer", "soup_and_salad"],
      productName: "Salmon Chowder",
      desc: "House-made creamy chowder, yukon gold potatoes, lemon oil",
      ingredients: "House-made creamy chowder, yukon gold potatoes, lemon oil",
      price: 14,
      imageUrl: "assets/images/eat/salmon_chowder.png",
      sizes: ["Regular", "Large"],
      similars: [
        "15",
      ]),
  EatProduct(
      id: "23",
      vendorId: "3",
      categories: ["seafood", "french"],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
];
//french
List<EatProduct> featuredVendorProducts4 = [
  EatProduct(
      id: "22",
      vendorId: "4",
      categories: ["soup_and_salad", "appetizer", "french"],
      productName: "Gem Salad",
      desc: "Locally sourced",
      ingredients:
          "LOCAL GEM LETTUCE, RADISH, CUCUMBER, CHERRY TOMATO, SHAVED CARROT, CITRUS HONEY VINAIGRETTE",
      price: 16,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["21"]),
  EatProduct(
      id: "23",
      vendorId: "4",
      categories: ["seafood", "french"],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
  EatProduct(
      id: "24",
      vendorId: "4",
      categories: ["soup", "soup_and_salad", "vegetarian"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["25"]),
];
//vegetarian
List<EatProduct> featuredVendorProducts5 = [
  EatProduct(
      id: "24",
      vendorId: "4",
      categories: ["soup", "soup_and_salad", "vegetarian"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["25"]),
  EatProduct(
      id: "26",
      vendorId: "4",
      categories: ["soup_and_salad", "salad", "vegetarian"],
      productName: "Caprese Salad",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, vegan mozzarella, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["3"]),
  EatProduct(
      id: "27",
      vendorId: "4",
      categories: ["appetizer", "snack", "vegetarian"],
      productName: "Tofu Bites",
      desc: "Delicious tofu",
      ingredients: "Tofu olive oil",
      price: 15,
      imageUrl: "assets/images/eat/pretzel_bites.png",
      sizes: ["Small", "Large"],
      similars: ["24"]),
];

List<Map<EatVendor, List<EatProduct>>> featuredVendorProducts = [
  {eatVendorsData0[0]: featuredVendorProducts0},
  {eatVendorsData0[1]: featuredVendorProducts1},
  {eatVendorsData1[0]: featuredVendorProducts2},
  {eatVendorsData1[1]: featuredVendorProducts3},
  {eatVendorsData2[0]: featuredVendorProducts4},
  {eatVendorsData2[1]: featuredVendorProducts5}
];

List<EatProduct> vegetarianEatProducts = [
  EatProduct(
      id: "24",
      vendorId: "5",
      categories: ["soup", "soup_and_salad", "vegetarian"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["25"]),
  EatProduct(
      id: "25",
      vendorId: "5",
      categories: ["appetizer", "snack", "vegetarian"],
      productName: "Pretzel Bites",
      desc: "Delicious pretzels",
      ingredients: "Vegan bread and cheese, romano, olive oil",
      price: 15,
      imageUrl: "assets/images/eat/pretzel_bites.png",
      sizes: ["Small", "Large"],
      similars: ["24"]),
  EatProduct(
      id: "26",
      vendorId: "5",
      categories: ["soup_and_salad", "salad", "vegetarian"],
      productName: "Caprese Salad",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, vegan mozzarella, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["3"]),
  EatProduct(
      id: "27",
      vendorId: "5",
      categories: ["appetizer", "snack", "vegetarian"],
      productName: "Tofu Bites",
      desc: "Delicious tofu",
      ingredients: "Tofu olive oil",
      price: 15,
      imageUrl: "assets/images/eat/pretzel_bites.png",
      sizes: ["Small", "Large"],
      similars: ["24"]),
];

List<EatProduct> frenchEatProducts = [
  EatProduct(
      id: "20",
      vendorId: "4",
      categories: ["appetizer", "snack", "french"],
      productName: "Cheese Bread",
      desc: "Crispy cheese bread",
      ingredients:
          "MORNAY CHEESE SAUCE, BRAISED SHORT RIB, CARAMELIZED ONION, CHIVE",
      price: 12,
      imageUrl: "assets/images/eat/cheese_bread.png",
      sizes: ["Regular", "Large"],
      similars: ["1"]),
  EatProduct(
      id: "21",
      vendorId: "4",
      categories: ["soup", "soup_and_salad", "french"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["22"]),
  EatProduct(
      id: "22",
      vendorId: "4",
      categories: ["soup_and_salad", "appetizer", "french"],
      productName: "Gem Salad",
      desc: "Locally sourced",
      ingredients:
          "LOCAL GEM LETTUCE, RADISH, CUCUMBER, CHERRY TOMATO, SHAVED CARROT, CITRUS HONEY VINAIGRETTE",
      price: 16,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["21"]),
  EatProduct(
      id: "23",
      vendorId: "4",
      categories: ["seafood", "french"],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
];

List<EatProduct> seafoodEatProducts = [
  EatProduct(
      id: "19",
      vendorId: "3",
      categories: ["pasta", "seafood"],
      productName: "Black Shrimp Pasta",
      desc: "Black Shrimp Pasta",
      ingredients:
          "BLACK TIGER SHRIMP, ANDOUILLE SAUSAGE, MUSSELS, PEPPERS, ONIONS, CAJUN CREAMY TOMATO SAUCE, PARMESAN, BAGUETTE",
      price: 22,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Regular"],
      similars: ["16"]),
  EatProduct(
      id: "14",
      vendorId: "3",
      categories: ["appetizer", "soup_and_salad"],
      productName: "Salmon Chowder",
      desc: "House-made creamy chowder, yukon gold potatoes, lemon oil",
      ingredients: "House-made creamy chowder, yukon gold potatoes, lemon oil",
      price: 14,
      imageUrl: "assets/images/eat/salmon_chowder.png",
      sizes: ["Regular", "Large"],
      similars: [
        "15",
      ]),
  EatProduct(
      id: "15",
      vendorId: "3",
      categories: ["appetizer"],
      productName: "Yellowtail Ceviche",
      desc: "kanpachi, orange yuzu, ginger, mint, pomegranate, crispy quinoa",
      ingredients:
          "kanpachi, orange yuzu, ginger, mint, pomegranate, crispy quinoa",
      price: 16,
      imageUrl: "assets/images/eat/yellowtail_ceviche.png",
      sizes: ["Regular"],
      similars: [
        "14",
      ]),
  EatProduct(
      id: "16",
      vendorId: "3",
      categories: ["seafood"],
      productName: "Mixed Grilled For One",
      desc: "salmon (4 oz), kanpachi (4 oz) jumbo shrimp (2 pc)",
      ingredients:
          "miso chili lemon butter + pick a preparation and sauce style that comes with a side + pick four additional sides or double up your favorites",
      price: 22,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: [
        "17",
      ]),
  EatProduct(
      id: "17",
      vendorId: "3",
      categories: ["seafood"],
      productName: "Mixed Grilled For Two",
      desc: "Salmon (6 oz), kanpachi (6 oz), jumbo shrimp (4 pc)",
      ingredients:
          "miso chili lemon butter + pick a preparation and sauce style that comes with a side + pick four additional sides or double up your favorites",
      price: 32,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: [
        "16",
      ]),
  EatProduct(
      id: "18",
      vendorId: "3",
      categories: ["seafood"],
      productName: "Crab Roll",
      desc: "Dungeness crab, shrimp, tarragon-dill sauce",
      ingredients:
          "avocado, radish, romaine, chives, butter-toasted King’s® Hawaiian roll, sesame slaw on the side, sesame slaw, choice of fries",
      price: 18,
      imageUrl: "assets/images/eat/crab_roll.png",
      sizes: ["Regular"],
      similars: [
        "17",
      ])
];

List<EatProduct> ristoranteEatProducts = [
  EatProduct(
      id: "0",
      vendorId: "0",
      categories: ["appetizer", "pasta"],
      productName: "Shrimp Pasta",
      desc: "Delicious Shrimp Pasta",
      ingredients: "Shrimp romano, olive oil, and fresh basil.",
      price: 10,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["1", "2"]),
  EatProduct(
      id: "1",
      vendorId: "0",
      categories: ["appetizer", "snack"],
      productName: "Pretzel Bites",
      desc: "Delicious pretzels",
      ingredients: "Parmigiano, romano, olive oil",
      price: 15,
      imageUrl: "assets/images/eat/pretzel_bites.png",
      sizes: ["Small", "Medium", "Large", "Extra Large"],
      similars: ["2"]),
  EatProduct(
      id: "2",
      vendorId: "0",
      categories: ["appetizer", "snack"],
      productName: "Cheese Bread",
      desc: "Delicious cheese bread",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/cheese_bread.png",
      sizes: ["Regular", "Large"],
      similars: ["1"]),
  EatProduct(
      id: "3",
      vendorId: "0",
      categories: ["soup", "soup_and_salad"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["5"]),
  EatProduct(
      id: "4",
      vendorId: "0",
      categories: ["soup_and_salad"],
      productName: "Caprese Salad",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, vegan mozzarella, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["3"]),
  EatProduct(
      id: "5",
      vendorId: "0",
      categories: ["pasta"],
      productName: "Shrimp Pasta",
      desc: "Delicious Shrimp Pasta",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 10,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["1", "2"]),
  EatProduct(
      id: "6",
      vendorId: "0",
      categories: ["featured"],
      productName: "Classic Chicken Cordon Blue",
      desc: "Delicious cordon blue",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 16,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["0", "3"]),
  EatProduct(
      id: "7",
      vendorId: "0",
      categories: ["featured"],
      productName: "Deluxe Chicken Soup",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Small", "Regular"],
      similars: ["0", "3"]),
];

List<EatProduct> sushiEatProducts = [
  EatProduct(
      id: "9",
      vendorId: "2",
      categories: ["appetizer"],
      productName: "Agedashi Tofu",
      desc: "Fried Tofu with Tempura sauce",
      ingredients: "Fried Tofu with Tempura sauce",
      price: 11,
      imageUrl: "assets/images/eat/agedashi_tofu.png",
      sizes: ["Regular"],
      similars: ["10", "11"]),
  EatProduct(
      id: "10",
      vendorId: "2",
      categories: ["appetizer"],
      productName: "Mixed Tempura",
      desc: "2 Shrimps assorted vegetables",
      ingredients: "2 Shrimps assorted vegetables",
      price: 14,
      imageUrl: "assets/images/eat/mixed_tempura.png",
      sizes: ["Regular"],
      similars: ["9", "11"]),
  EatProduct(
      id: "11",
      vendorId: "2",
      categories: ["appetizer"],
      productName: "Takyoyaki",
      desc: "Octopus in light fried dough",
      ingredients: "Octopus in light fried dough",
      price: 14,
      imageUrl: "assets/images/eat/takyoyaki.png",
      sizes: ["Regular"],
      similars: ["9", "10"]),
  EatProduct(
      id: "11",
      vendorId: "2",
      categories: ["sushi"],
      productName: "Salmon Sushi",
      desc: "Salmon with rice",
      ingredients: "Salmon with rice",
      price: 12,
      imageUrl: "assets/images/eat/salmon_sushi.png",
      sizes: ["Regular"],
      similars: ["12", "13"]),
  EatProduct(
      id: "12",
      vendorId: "2",
      categories: ["sushi"],
      productName: "Tuna Sushi",
      desc: "Tuna with rice",
      ingredients: "Tuna with rice",
      price: 12,
      imageUrl: "assets/images/eat/tuna_sushi.png",
      sizes: ["Regular"],
      similars: ["11", "13"]),
  EatProduct(
      id: "13",
      vendorId: "2",
      categories: ["sushi"],
      productName: "Sweet Egg Sushi",
      desc: "Sweet egg with rice",
      ingredients: "Sweet egg with rice",
      price: 12,
      imageUrl: "assets/images/eat/sweet_egg_sushi.png",
      sizes: ["Regular"],
      similars: ["11", "12"]),
];

List<EatProduct> italyEatProducts = [
  EatProduct(
      id: "8",
      vendorId: "1",
      categories: ["appetizer"],
      productName: "Bruschetta",
      desc:
          "Grilled bread rubbed with garlic and topped with olive oil and salt.",
      ingredients: "Garlic, olive oil, salt, tomato, fresh basil, cream cheese",
      price: 11,
      imageUrl: "assets/images/eat/bruschetta.png",
      sizes: ["Regular"],
      similars: ["0", "3"]),
  EatProduct(
      id: "5",
      vendorId: "1",
      categories: ["pasta"],
      productName: "Shrimp Pasta",
      desc: "Delicious Shrimp Pasta",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 10,
      imageUrl: "assets/images/eat/shrimp_pasta.png",
      sizes: ["Bowl", "Plate"],
      similars: ["1", "2"]),
  EatProduct(
      id: "4",
      vendorId: "1",
      categories: ["soup_and_salad", "appetizer"],
      productName: "Caprese Salad",
      desc: "Delicious soup",
      ingredients:
          "Tomato sauce, mozzarella, parmigiano, romano, olive oil, and fresh basil.",
      price: 12,
      imageUrl: "assets/images/eat/caprese_salad.png",
      sizes: ["Small", "Large"],
      similars: ["3"]),
  EatProduct(
      id: "3",
      vendorId: "1",
      categories: ["soup_and_salad"],
      productName: "Minestrone Di Vegetali",
      desc: "Delicious soup",
      ingredients: "Green beans, spinach and pesto",
      price: 14,
      imageUrl: "assets/images/eat/minestrone.png",
      sizes: ["Regular", "Large"],
      similars: ["5"]),
  EatProduct(
      id: "23",
      vendorId: "1",
      categories: ["seafood", "italian"],
      productName: "GRILLED BRANZINO",
      desc: "Seabass and salad",
      ingredients:
          "CRISPY SKIN SEABASS FILET, ARUGULA AND TOMATO SALAD, CHIMICHURRI, GRILLED LEMON",
      price: 28,
      imageUrl: "assets/images/eat/sf_mixed_grilled.png",
      sizes: ["Regular"],
      similars: []),
];

List<EatProduct> allEatProducts = [
  ...ristoranteEatProducts,
  ...italyEatProducts,
  ...sushiEatProducts,
  ...seafoodEatProducts,
  ...vegetarianEatProducts,
  ...frenchEatProducts
];
