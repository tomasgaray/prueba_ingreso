class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Address(
      {this.street,
      this.suite,
      this.city,
      this.zipcode});

  factory Address.deserialize(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      suite: json["suite"],
      city: json['city'],
      zipcode:json['zipcode']
    );
  }

  Map<String, dynamic> toJson() => {
        'street': street ?? "",
        'suite': suite??"",
        'city': city??"",
        'zipcode': zipcode??""
      };
}
