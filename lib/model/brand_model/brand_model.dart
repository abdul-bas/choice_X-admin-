class BrandModel {
  final String name;
  final String image;
  final String id;
  BrandModel({
    required this.name,
    required this.image,
    required this.id
  });

  factory BrandModel.fromDoc(
    Map<String, dynamic> data,String id
  ) {
    return BrandModel(
      id:  id,
      name: data['name']?.toString() ?? '',
      image: data['image']?.toString() ?? '',
    );
  }
}
