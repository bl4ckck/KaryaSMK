class ProductModel {
  String idProduct;
  String title;
  String image;
  int price;
  String desc;
  int qty;

  ProductModel(
      this.idProduct, this.title, this.image, this.price, this.desc, this.qty);

  ProductModel.listCard(this.idProduct, this.title, this.image, this.price);
}
