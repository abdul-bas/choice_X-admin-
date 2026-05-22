class OrderItemModel {
  final String orderId;        
  final String userId;          
  final String productId;       
  final String sellerId;
  final int variantIndex;      
  final int quantity;
  final double amount;         
  final String itemStatus;    
  final DateTime date;        

  OrderItemModel({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.sellerId,
    required this.variantIndex,
    required this.quantity,
    required this.amount,
    required this.itemStatus,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'productId': productId,
      'sellerId': sellerId,
      'variantIndex': variantIndex,
      'quantity': quantity,
      'amount': amount,
      'itemStatus': itemStatus,
      'date': date.toIso8601String(),
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      sellerId: map['sellerId'] ?? '',
      variantIndex: (map['variantIndex'] as num?)?.toInt() ?? 0,
      quantity: (map['quantity'] as num?)?.toInt() ?? 1,
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      itemStatus: map['itemStatus'] ?? 'Pending',
      date: map['date'] != null
          ? DateTime.parse(map['date'])
          : DateTime.now(),
    );
  }
}
