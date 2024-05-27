class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  Map<String, String> toJson() => {
        "email": email,
        "password": password,
      };
}
