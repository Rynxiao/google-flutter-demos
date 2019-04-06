class User {
  int id;
  String name;
  String phone;

  User({this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phone": phone,
  };

  static fromMap(Map<String, dynamic> user) => User(
    id: user["id"],
    name: user["name"],
    phone: user["phone"],
  );
}