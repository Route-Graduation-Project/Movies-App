class LoginResponseEntity {
  final String? token;
  final String message;

  LoginResponseEntity({
    this.token,
    required this.message,
  });
}