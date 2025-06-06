class SplitBillItem {
  String name;
  int quantity;
  double pricePerUnit;
  List<String> assignedMembers;

  SplitBillItem({
    required this.name,
    this.quantity = 1,
    required this.pricePerUnit,
    this.assignedMembers = const [],
  });

  double get total => quantity * pricePerUnit;
}
