// take list of string numbers string line items
calcOrderTotalFromSlis(List<String> slis) {
  double calcTotal = 0;
  for (var sli in slis) {
    calcTotal += double.parse(sli);
  }
  return calcTotal.toStringAsFixed(2);
}
