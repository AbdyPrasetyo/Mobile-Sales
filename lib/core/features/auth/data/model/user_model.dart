class UserModel {
  final String id;
  final String email;
  final String jabatan;
  final bool faceRegistered;
  final bool isActive;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.jabatan,
    required this.faceRegistered,
    required this.isActive,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      jabatan: json['jabatan'],
      faceRegistered: json['face_registered'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}