import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';

// API request
requestShopVendorForProduct(String vendorId) {}

// check cache
getShopVendorForProduct(ShopProduct prod) {
  ShopVendor? getShopVendor;
  // check cached vendors for id
  for (ShopVendor sv in shoppingStoreData) {
    if (sv.id == prod.vendorId) {
      getShopVendor = sv;
      return getShopVendor;
    }
  }
  // get vendor data from API
  if (getShopVendor == null) {
    requestShopVendorForProduct(prod.vendorId!);
  }
}
