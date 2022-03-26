import 'dart:convert';
import 'package:app_test_lci/service/config.dart';
import 'package:app_test_lci/views/form/form_add.dart';
import 'package:app_test_lci/views/form/form_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model_user.dart';
import 'package:http/http.dart' as http;

import './form/form_add.dart';

ServiceUrl serviceUrl = ServiceUrl();

Future<List<Users>> _getDataUsers() async {
  var response = await http.get(Uri.parse(serviceUrl.url_page), headers: {
    'Content-Type': 'application/json',
    'app-id': serviceUrl.app_id
  });
  var jsonData = json.decode((response.body));
  List<Users> users = [];

  for (var u in jsonData['data']) {
    Users user = Users(
      id: u['id'].toString(),
      title: u['title'],
      firstName: u['firstName'],
      lastName: u['lastName'],
      picture: u['picture'],
      email: u['email'].toString(),
    );
    users.add(user);
  }
  return users;
}

class TaskPage2 extends StatelessWidget {
  const TaskPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Task 2"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const FormAddData());
        },
        backgroundColor: Colors.blueGrey,
        icon: const Icon(Icons.add),
        label: Text("Tambah Data"),
      ),
      body: BodyTask2(),
    );
  }
}

class BodyTask2 extends StatefulWidget {
  const BodyTask2({Key? key}) : super(key: key);

  @override
  State<BodyTask2> createState() => _BodyTask2State();
}

class _BodyTask2State extends State<BodyTask2> {
  late Future<Users> _futureUsers;
  Users dataRespund = Users();
  @override
  Widget build(BuildContext context) {
    // Future<List<Users>> _getData() async {

    return FutureBuilder(
      future: _getDataUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: const Text("Loading..."),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index].picture),
                ),
                title: Text(
                    snapshot.data[index].title.toString().toUpperCase() +
                        ". " +
                        snapshot.data[index].firstName +
                        " " +
                        snapshot.data[index].lastName),
                subtitle: Text(snapshot.data[index].id),
                trailing: Wrap(
                  spacing: 12,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Get.to(FormEditData(
                          id: snapshot.data[index].id.toString(),
                          firstName: snapshot.data[index].firstName,
                          lastName: snapshot.data[index].lastName,
                        ));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                        onPressed: () {
                          deleteUsers(snapshot.data[index].id.toString())
                              .then((value) {
                            setState(() {
                              dataRespund = value;
                            });
                            final snackBar = SnackBar(
                              content: Text(respoundDelete),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
