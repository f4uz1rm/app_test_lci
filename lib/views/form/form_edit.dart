import 'dart:convert';

import 'package:app_test_lci/models/model_user.dart';
import 'package:app_test_lci/service/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

ServiceUrl serviceUrl = ServiceUrl();

class FormEditData extends StatefulWidget {
  String id;
  String firstName;
  String lastName;

  FormEditData({
    Key? key,
    required this.id,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  State<FormEditData> createState() => _FormEditDataState();
}

class _FormEditDataState extends State<FormEditData> {
  TextEditingController idText = TextEditingController();

  TextEditingController firstNameText = TextEditingController();

  TextEditingController lastNameText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Users dataRespund = Users();
    idText = TextEditingController(text: widget.id);
    firstNameText = TextEditingController(text: widget.firstName);
    lastNameText = TextEditingController(text: widget.lastName);

    return Scaffold(
      appBar: AppBar(title: Text("Edit Data")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                    controller: idText,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: firstNameText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: lastNameText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          primary: Colors.blueGrey),
                      onPressed: () {
                        updateUsers(idText.text, firstNameText.text,
                                lastNameText.text)
                            .then((value) {
                          setState(() {
                            dataRespund = value;
                          });
                        });
                      },
                      child: Text("Edit")),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Response :\n" + respoundEdit),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
