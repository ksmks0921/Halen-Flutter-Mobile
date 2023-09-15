/// For testing empty case
// List ordersHistoryData = [];
List ordersHistoryData = [
  {
    "order_number": "123456789",
    "service_type": "Eat",
    "service_date": "01/01/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Little Creatures - Club Street",
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary":
        "assets/images/orders/Little_creatures_storeimage.png",
    "order_status_type": "Order",
    "order_status_value": "Complete",
    "order_items": [
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Grocery",
    "service_date": "01/02/23, 11AM",
    "order_total_cost": "88.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Kroger",
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/grocery/kroger.png",
    "order_status_type": "Order",
    "order_status_value": "Cancelled",
    "order_items": [
      {
        "title": "Banana",
        "subtitle": "1 lb",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/banana@2x.png"
      },
      {
        "title": "Green Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/pepper.png"
      },
      {
        "title": "Red Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_all.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/03/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Complete",
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/04/23, 11AM",
    "order_total_cost": "20.05",
    "subtotal": "15.88",
    "driver_fee": "8.15",
    "tip": "5.00",
    "tax": "1.23",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "Cancelled",
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/05/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Cancelled",
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/06/23, 11AM",
    "order_total_cost": "30.05",
    "subtotal": "25.88",
    "tax": "1.23",
    "tip": "5.00",
    "driver_fee": "8.15",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "Complete",
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/07/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Complete",
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/08/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "tip": "5.00",
    "subtotal": "25.00",
    "driver_fee": "8.15",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "Cancelled",
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/09/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Complete",
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/10/23, 11AM",
    "order_total_cost": "90.05",
    "subtotal": "85.58",
    "tax": "1.23",
    "tip": "5.00",
    "driver_fee": "8.15",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "Complete",
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/11/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Complete",
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
];

// List ordersInProgressData = [];
List ordersInProgressData = [
  {
    "order_number": "123456789",
    "service_type": "Eat",
    "service_date": "01/01/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Little Creatures - Club Street",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary":
        "assets/images/orders/Little_creatures_storeimage.png",
    "order_status_type": "Order",
    "order_status_value": "Placed",
    "order_items": [
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Grocery",
    "service_date": "01/02/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Kroger",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/grocery/kroger.png",
    "order_status_type": "Order",
    "order_status_value": "Picked up",
    "order_items": [
      {
        "title": "Banana",
        "subtitle": "1 lb",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/banana@2x.png"
      },
      {
        "title": "Green Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/pepper.png"
      },
      {
        "title": "Red Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_all.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/03/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Placed",
    "is_cancellable": true,
    "is_returnable": false,
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/03/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "Placed",
    "is_cancellable": false,
    "is_returnable": false,
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/04/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "tip": "5.00",
    "subtotal": "25.00",
    "driver_fee": "8.15",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "On the way"
  },
  {
    "order_number": "123456789",
    "service_type": "Shop",
    "service_date": "01/05/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Target",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/shop/Target_logo.png",
    "order_status_type": "Order",
    "order_status_value": "On the way",
    "is_cancellable": false,
    "is_returnable": true,
    "order_items": [
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
      {
        "title": "Ralph Lauren Cable-Knit Vest",
        "subtitle": "M, black, small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/shop/MEN.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Eat",
    "service_date": "01/07/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "service_storefront_name": "Little Creatures - Club Street",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary":
        "assets/images/orders/Little_creatures_storeimage.png",
    "order_status_type": "Order",
    "order_status_value": "Placed",
    "order_items": [
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Grocery",
    "service_date": "01/08/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Kroger",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/grocery/kroger.png",
    "order_status_type": "Order",
    "order_status_value": "Picked up",
    "order_items": [
      {
        "title": "Banana",
        "subtitle": "1 lb",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/banana@2x.png"
      },
      {
        "title": "Green Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/pepper.png"
      },
      {
        "title": "Red Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_all.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Ride",
    "service_date": "01/09/23, 11AM",
    "order_total_cost": "70.05",
    "subtotal": "65.88",
    "driver_fee": "8.15",
    "tax": "1.23",
    "tip": "5.00",
    "ride_from_location": "ABC Lane, LA",
    "ride_to_location": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/ridesharing/Vehicles-04.png",
    "order_status_type": "Driver",
    "order_status_value": "On the way"
  },
  {
    "order_number": "123456789",
    "service_type": "Eat",
    "service_date": "01/10/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Little Creatures - Club Street",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary":
        "assets/images/orders/Little_creatures_storeimage.png",
    "order_status_type": "Order",
    "order_status_value": "Placed",
    "order_items": [
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
      {
        "title": "Caesar Salad",
        "subtitle": "small",
        "price": "30.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_vegetable.png"
      },
    ]
  },
  {
    "order_number": "123456789",
    "service_type": "Grocery",
    "service_date": "01/11/23, 11AM",
    "order_total_cost": "30.05",
    "tax": "1.23",
    "subtotal": "25.00",
    "delivery_fee": "5.05",
    "est_delivery_time": "30",
    "delivery_on_time": "On Time",
    "payment_method": {
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "card_number": "1234432112344321",
      "balance": "234",
      "auto-refill": "false"
    },
    "service_storefront_name": "Kroger",
    "service_is_local": true,
    "delivery_address": "1915 Moser ave, apt 214",
    "service_address": "856 Esta Underpass",
    "driver": {
      "name": "Jaylon Rosser",
      "car_model": "Mercedes c300",
      "drivers_license": "7DX8HFGT",
      "car_license_plate": "WB 02K 1823",
      "profile_img": "assets/images/illustrations/profile_image.png"
    },
    "service_img_primary": "assets/images/grocery/kroger.png",
    "order_status_type": "Order",
    "order_status_value": "Picked up",
    "order_items": [
      {
        "title": "Banana",
        "subtitle": "1 lb",
        "price": "30.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/banana@2x.png"
      },
      {
        "title": "Green Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "3",
        "img_path": "assets/images/grocery/pepper.png"
      },
      {
        "title": "Red Pepper",
        "subtitle": "1 lb",
        "price": "15.00",
        "quantity": "1",
        "img_path": "assets/images/grocery/category_all.png"
      },
    ]
  },
];
