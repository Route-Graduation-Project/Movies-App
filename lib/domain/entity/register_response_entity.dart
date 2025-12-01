class RegisterResponseEntity {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? message;
  num? avatarId;
  RegisterResponseEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarId,
    required this.message,
  });
}
