class CategoryModel {
  final String name;
  final String image;
  final String id;
  CategoryModel({
    required this.name,
    required this.image,
    required this.id
  });

  factory CategoryModel.fromDoc(
    Map<String, dynamic> data,String id
  ) {
    return CategoryModel(
      id:  id,
      name: data['name']?.toString() ?? '',
      image: data['image']?.toString() ?? '',
    );
  }
}
