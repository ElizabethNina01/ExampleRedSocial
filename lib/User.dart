class User{
  late  int id;
  late  String name;
  late  String username;
  late  String email;
  late Address address;
  late  String phone;
  late  String website;
  late Company company;

  User(this.id,this.name,this.username, this.email, this.address,this.phone,this.website,this.company);

  User.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
    this.username = parsedJson['username'];
    this.email = parsedJson['email'];
    this.address =
        Address(parsedJson['address']['street'],parsedJson['address']['suite'],parsedJson['address']['city'],
                parsedJson['address']['zipcode'],Geo(parsedJson['address']['geo']['lat'],parsedJson['address']['geo']['lat']));
    this.phone = parsedJson['phone'];
    this.website=parsedJson['website'];
    this.company=Company(parsedJson['company']['name'], parsedJson['company']['catchPhrase'], parsedJson['company']['bs']);
  }
}

class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

}

class Geo{
  String lat;
  String lng;

  Geo(this.lat,this.lng);
}

class Company{
  String name;
  String catchPhrase;
  String bs;

  Company(this.name,this.catchPhrase, this.bs);
}