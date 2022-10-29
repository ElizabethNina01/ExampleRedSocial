import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'User.dart';

class HttpHelper {
  final String urlBase = 'https://jsonplaceholder.typicode.com/';
  final String urlSearchBase ='users?email=';


  Future<List> findUserByEmail(String email) async {
    final String query = urlBase + urlSearchBase + email ;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List users = jsonResponse.map((i) =>
          User.fromJson(i)).toList();
      return users;
    }
    else {
      return <User>[User(1, 'name', 'username', 'email',Address('street', 'suite', 'city', 'zipcode', Geo('lat', 'lng')),
            'phone', 'website', Company('name', 'catchPhrase', 'bs'))];
    }
  }
}


