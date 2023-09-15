import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';

// API request
requestGroceryVendorForProduct(String vendorId) {}

// check cache
getGroceryVendorForProduct(GroceryProduct prod) {
  GroceryVendor? getGroceryVendor;
  // check cached vendors for id
  for (GroceryVendor gv in groceryStoreData) {
    if (gv.id == prod.vendorId) {
      getGroceryVendor = gv;
      return getGroceryVendor;
    }
  }
  // get vendor data from API
  if (getGroceryVendor == null) {
    requestGroceryVendorForProduct(prod.vendorId!);
  }
}
