class DriverData {
  String? driverName;
  DriverData({this.driverName});
}

class RideOrderData {
  String? pickupLocation;
  String? destinationLocation;
  String? price;
  DriverData? driverData;

  RideOrderData({
    this.pickupLocation,
    this.destinationLocation,
    this.price,
    this.driverData,
  });
}
