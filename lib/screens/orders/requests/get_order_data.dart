import 'package:halen_customer_app/screens/orders/models/order_models.dart';
import 'package:halen_customer_app/screens/orders/data.dart';

// Attempt to mock behavior of a paged DB call
// Responses at limits will probably need to be refactored,
// DB will probably return error instead of empty list
// keep in mind getRange returns the index one less than its higher arg
// e.g. [1,2,3].getRange(0,2) returns [1,2]
Future<List> getOrderData(int page, int pageSize, OrderStatus status) {
  int startIdx, endIdx = 0;
  startIdx = page * pageSize;
  endIdx = (page + 1) * pageSize;

  List orderData;
  status == OrderStatus.complete
      ? orderData = ordersHistoryData
      : orderData = ordersInProgressData;

  return Future.delayed(const Duration(milliseconds: 200), () {
    if (startIdx == orderData.length ||
        orderData.isEmpty ||
        startIdx > orderData.length) {
      return [];
    } else if (endIdx > orderData.length) {
      List rangeList = orderData.getRange(startIdx, orderData.length).toList();
      return rangeList;
    }
    List rangeList = orderData.getRange(startIdx, endIdx).toList();
    return rangeList;
  });
}
