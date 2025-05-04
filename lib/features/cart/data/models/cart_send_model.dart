class CartSendModel {
  final int id;
  final int quantity;

  static const String idKey = 'id';
  static const String quantityKey = 'quantity';

  CartSendModel({required this.id, required this.quantity});

  factory CartSendModel.fromJson(Map<String, dynamic> json) {
    return CartSendModel(id: json[idKey], quantity: json[quantityKey]);
  }

  Map<String, dynamic> toJson() {
    return {idKey: id, quantityKey: quantity};
  }
}
