class Account {
  String fullname;
  String email;
  String phone;
  String password;

  Account({required this.fullname, required this.email, required this.phone, required this.password});


  Account.fromJson(Map<String, dynamic> json)
      : fullname = json["fullname"],
        email = json["email"],
        phone = json["phone"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
    "fullname":fullname,
    "email": email,
    "phone":phone,
    "password": password,
  };

}