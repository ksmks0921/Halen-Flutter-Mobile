class RideLocation {
  String addressShort;
  String locationTitle;
  RideLocation({required this.addressShort, required this.locationTitle});
}

List<RideLocation> rideOptionsTestData = [
  RideLocation(
      addressShort: "8 Norman st East Dallas, NSW 20102",
      locationTitle: "Dallas Steakhouse"),
  RideLocation(
      addressShort: "127 Station ln Dallas 32075",
      locationTitle: "Melbourne Park"),
  RideLocation(
      addressShort: "7861 Rose st Sherwin 61054",
      locationTitle: "Triangle Village"),
  RideLocation(
      addressShort: "5252 Blossom dr Carin 25242",
      locationTitle: "Spring Lake"),
  RideLocation(
      addressShort: "1434 Forest Hill ln Esocho 63532",
      locationTitle: "Crane Hill Mall"),
];
