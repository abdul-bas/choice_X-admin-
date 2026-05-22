class CouponModel {
  final String id;
  final String title;
  final String code;
  final double discountPercent;
  final double maxDiscount;
  final String applyType; 
  final List<String> categories;
  final List<String> brands;
  final bool isActive;
  final DateTime createdAt;

  CouponModel({
    required this.id,
    required this.title,
    required this.code,
    required this.discountPercent,
    required this.maxDiscount,
    required this.applyType,
    this.categories = const [],
    this.brands = const [],
    this.isActive = true,
    required this.createdAt,
  });

 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'discountPercent': discountPercent,
      'maxDiscount': maxDiscount,
      'applyType': applyType,
      'categories': categories,
      'brands': brands,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  
  factory CouponModel.fromMap(Map<String, dynamic> map) {
    return CouponModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      code: map['code'] ?? '',
      discountPercent: (map['discountPercent'] ?? 0).toDouble(),
      maxDiscount: (map['maxDiscount'] ?? 0).toDouble(),
      applyType: map['applyType'] ?? 'all',
      categories: List<String>.from(map['categories'] ?? []),
      brands: List<String>.from(map['brands'] ?? []),
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
