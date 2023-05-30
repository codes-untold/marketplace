class ProductModel {
  String imgPath;
  String productName;
  bool isFavourite;
  String price;
  String shortDescription;

  ProductModel(
      {required this.imgPath,
      required this.isFavourite,
      required this.price,
      required this.productName,
      required this.shortDescription});
}
