class ProductModel {
  String id;
  String sellerId;
  String productName;
  String brand;
  String model;
  String description;
  String category;
  String productType;
  List<String> connectivityOptions;
  String warranty;
  String? weight;
  String size;
  String tag;
  List<String> imges;
  String manufactureDate;
  String addedDate;
  String status;
  List<Map<String, dynamic>> variant;
  final int expectedDeliveryDays;

  ProductModel(
      {required this.id,
      required this.sellerId,
      required this.productName,
      required this.brand,
      required this.model,   
      required this.description,
      required this.category,
      required this.productType,
      required this.connectivityOptions,
      required this.warranty,
      this.weight,
      required this.size,
      required this.tag,
      required this.manufactureDate,
      required this.addedDate,
      required this.status,
      required this.imges,
      required this.variant,
      required this.expectedDeliveryDays, });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'sellerId': sellerId,
      'ProductName': productName,
      'Brand': brand,
      'Model': model,
      'Variant': variant,
      'Description': description,
      'Category': category,
      'Type': productType,
      'ConnectivityOptions': connectivityOptions,
      'Warranty': warranty,
      'Weight': weight,
      'SizeDimensions': size,
      'TagsKeywords': tag,
      'ManufactureDate': manufactureDate,
      'AddedDate': addedDate,
      'Productimages': imges,
       'expectedDeliveryDays': expectedDeliveryDays,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      sellerId: map['sellerId'] ?? '',
      productName: map['ProductName'] ?? '',
      brand: map['Brand'] ?? '',
      model: map['Model'] ?? '',
      description: map['Description'] ?? '',
      category: map['Category'] ?? '',
      productType: map['Type'] ?? '',
      variant: List<Map<String,dynamic>>.from(map['Variant'] ?? []),
      connectivityOptions: List<String>.from(map['ConnectivityOptions'] ?? []),
      warranty: map['Warranty'] ?? '',
      weight: map['Weight'],
      size: map['SizeDimensions'] ?? '',
      tag: map['TagsKeywords'] ?? '',
      manufactureDate: map['ManufactureDate'] ?? '',
      addedDate: map['AddedDate'] ?? '',
      status: map['status'],
      imges: List<String>.from(map['Productimages'] ?? []),
      expectedDeliveryDays: map['expectedDeliveryDays'],
    );
  }
}
