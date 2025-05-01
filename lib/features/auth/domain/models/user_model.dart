class UserModel {
  final String id;
  final String phoneNumber;
  final String name;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      phoneNumber: json['phone_number'] as String,
      name: json['name'] as String,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'] as String)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'name': name,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
