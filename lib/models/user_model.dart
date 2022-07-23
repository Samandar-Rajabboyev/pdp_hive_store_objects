class User {
  String? email;
  String? password;

  User({required this.email, required this.password});

  User.fromMap(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> get toMap => {"email": email, "password": password};

  @override
  String toString() => "User(email: $email, password: $password)";
}
