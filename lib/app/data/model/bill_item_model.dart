
class BillItemModel {
  String name;
  double price;
  int quantity;

  BillItemModel({required this.name, required this.price, this.quantity = 1});

  double get total => price * quantity;
}
