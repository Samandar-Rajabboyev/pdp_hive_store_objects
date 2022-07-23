class Account {
  String? email;
  String? number;
  String? address;

  Account({required this.email, required this.number, required this.address});

  Account.fromMap(Map<String, dynamic> json)
      : email = json['email'],
        number = json['number'],
        address = json['address'];

  Map<String, dynamic> get toMap => {"email": email, "number": number, 'address': address};

  @override
  String toString() => "Account(email: $email, number: $number,address: $address)";
}
