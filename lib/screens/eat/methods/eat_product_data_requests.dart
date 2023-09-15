import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/models.dart';

// API request
requestEatVendorForProduct(String vendorId) {}

// check cache
getEatVendorForProduct(EatProduct prod) {
  EatVendor? getEatVendor;
  // check cached vendors for id
  for (EatVendor gv in allEatVendors) {
    if (gv.id == prod.vendorId) {
      getEatVendor = gv;
      return getEatVendor;
    }
  }
  // get vendor data from API
  if (getEatVendor == null) {
    requestEatVendorForProduct(prod.vendorId!);
  }
}
