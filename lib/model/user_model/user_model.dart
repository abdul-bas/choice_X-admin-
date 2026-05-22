class UserModel {
  String name;
  String email;
  String? uid;
  String password;

  
  DateTime createdAt;
  List<Map<String, dynamic>>? address;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.uid,
    required this.createdAt, 
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'],
      password: map['password'] ?? '',
      
  
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),

      address: (map['address'] as List?)
          ?.cast<Map<String, dynamic>>(),
    );
  }
}