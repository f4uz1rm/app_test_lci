import 'package:app_test_lci/service/config.dart';
import 'package:flutter/material.dart';
import '../../models/model_user.dart';

ServiceUrl serviceUrl = ServiceUrl();

class FormAddData extends StatefulWidget {
  const FormAddData({Key? key}) : super(key: key);

  @override
  State<FormAddData> createState() => _FormAddDataState();
}

class _FormAddDataState extends State<FormAddData> {
  @override
  Widget build(BuildContext context) {
    Users dataRespund = Users();

    TextEditingController firstNameText = TextEditingController();
    TextEditingController lastNameText = TextEditingController();
    TextEditingController emailText = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Data")),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: firstNameText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: lastNameText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        minimumSize: Size.fromHeight(50),
                      ),
                      onPressed: () {
                        createUsers(firstNameText.text, lastNameText.text,
                                emailText.text)
                            .then((value) => {
                                  setState(() {
                                    dataRespund = value;
                                  }),
                                });
                      },
                      child: Text("Simpan")),
                  SizedBox(height: 10),
                  Text("Respound : \n" + respoundSimpan),
                ],
              ))),
    );
  }
}
