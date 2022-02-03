import 'address.dart';

class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? website;
  Address? address;

  User({
        this.id,
        this.name,
        this.userName,
        this.email,
        this.phone,
        this.website,
        this.address
      });

  factory User.deserialize(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      userName: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.deserialize(json['address']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id ?? 0,
        'name': name,
        'username': userName,
        'email': email,
        'phone': phone,
        'website': website,
        'address': address?.toJson(),
      };
}
