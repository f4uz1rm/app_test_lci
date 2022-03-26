import 'dart:convert';
import '../service/config.dart';
import 'package:http/http.dart' as http;

ServiceUrl serviceUrl = ServiceUrl();

class Users {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final String? email;

  Users(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.picture,
      this.email});

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        title = json['title'].toString(),
        firstName = json['firstName'].toString(),
        lastName = json['lastName'].toString(),
        picture = json['picture'].toString(),
        email = json['email'].toString();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
        'email': email,
      };
}

String respoundSimpan = "";
Future<Users> createUsers(
    String firstName, String lastName, String email) async {
  final response =
      await http.post(Uri.parse(serviceUrl.url_page + "/create"), headers: {
    'app-id': serviceUrl.app_id
  }, body: {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
  });
  respoundSimpan = (response.body).toString();
  return Users.fromJson(jsonDecode(response.body));
}

String respoundEdit = "";
Future<Users> updateUsers(String id, String firstName, String lastName) async {
  final response = await http.put(
    Uri.parse(serviceUrl.url_page + "/$id"),
    headers: {
      'app-id': serviceUrl.app_id,
    },
    body: {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    },
  );
  respoundEdit = response.body;
  return Users.fromJson(jsonDecode(response.body));
}

String respoundDelete = "";
Future<Users> deleteUsers(String id) async {
  final http.Response response =
      await http.delete(Uri.parse(serviceUrl.url_page + "/$id"), headers: {
    'app-id': serviceUrl.app_id,
  }, body: {
    'id': id,
  });
  respoundDelete = response.body;
  return Users.fromJson(jsonDecode(response.body));
}
