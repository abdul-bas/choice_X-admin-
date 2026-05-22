class AdminModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String role;

  AdminModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}