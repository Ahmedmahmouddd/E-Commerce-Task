class CartSendModel {
  final int id;
  final int quantity;

  CartSendModel({required this.id, required this.quantity});

  factory CartSendModel.fromJson(Map<String, dynamic> json) {
    return CartSendModel(
      id: json['id'],
      quantity: json['quantity'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}
