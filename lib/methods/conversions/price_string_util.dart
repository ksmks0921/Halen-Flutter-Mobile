twoDecItemPriceString(double priceDouble) {
  try {
    return "\$${priceDouble.toStringAsFixed(2)}";
  } catch (e) {
    return "";
  }
}
