class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? website;

  User({
        this.id,
        this.name,
        this.userName,
        this.email,
        this.phone,
        this.website,
      });

  factory User.deserialize(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      userName: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id ?? 0,
        'name': name,
        'username': userName,
        'email': email,
        'phone': phone,
        'website': website,
      };
}
