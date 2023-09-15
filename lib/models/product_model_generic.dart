// // a generic product class for other products to implement, it should contain
// // all the attributes of the other products as optional plus some required base ones
class GProduct {
  //required
  String productName;
  String imageUrl;
  double price;
  String desc;
  String id;
  String? vendorId;

  // optional
  List? categories;
  String? ingredients;
  int? quantity;
  List? sizes;
  int? selectedSize;
  List? colors;
  int? selectedColor;
  List? similars;
  double? rating;
  List? customizations;
  String? categoryId;
  double? markPrice;
  String? unitQuantity;
  String? weightOrDiscreteStr;
  String? brand;

  GProduct(
      {required this.productName,
      required this.price,
      required this.imageUrl,
      required this.desc,
      required this.id,
      this.vendorId,
      this.quantity,
      this.categories,
      this.categoryId,
      this.ingredients,
      this.sizes,
      this.selectedSize,
      this.similars,
      this.rating,
      this.markPrice,
      this.customizations,
      this.colors,
      this.selectedColor,
      this.unitQuantity,
      this.weightOrDiscreteStr,
      this.brand});

  // GProduct copyWith(
  //     {String? productName,
  //     double? price,
  //     String? imageUrl,
  //     String? desc,
  //     String? id,
  //     String? vendorId,
  //     String? categoryId,
  //     int? quantity,
  //     List? categories,
  //     String? ingredients,
  //     List? sizes,
  //     int? selectedSize,
  //     List? similars,
  //     List? customizations}) {
  //   return GProduct(
  //       productName: productName ?? this.productName,
  //       price: price ?? this.price,
  //       imageUrl: imageUrl ?? this.imageUrl,
  //       desc: desc ?? this.desc,
  //       id: id ?? this.id,
  //       vendorId: vendorId ?? this.vendorId,
  //       quantity: quantity ?? this.quantity,
  //       categories: categories ?? this.categories,
  //       categoryId: categoryId ?? this.categoryId,
  //       ingredients: ingredients ?? this.ingredients,
  //       sizes: sizes ?? this.sizes,
  //       selectedSize: selectedSize ?? this.selectedSize,
  //       similars: similars ?? this.similars,
  //       customizations: customizations ?? this.customizations);
  // }
}
