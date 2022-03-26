import 'dart:convert';
import '../models/model_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Posts dataRespundPost = Posts();
String respoundGetByid = "";

Future<List<Posts>> _getDataById(String tag) async {
  final response = await http
      .get(Uri.parse("https://dummyapi.io/data/v1/tag/$tag/post"), headers: {
    'accept': 'application/json',
    'app-id': '623c68d39cbe56271eae26a7'
  });
  var jsonData = json.decode((response.body));
  List<Posts> listtags = [];

  for (var u in jsonData['data']) {
    Posts user = Posts(
      id: u['id'],
      image: u['image'],
      likes: u['likes'],
      tags: u['tags'],
      text: u['text'],
      publishDate: u['publishDate'],
      owner: u['owner'],
    );
    listtags.add(user);
  }
  return listtags;
}

Future<List<Posts>> _getData() async {
  var response = await http.get(
    Uri.parse("https://dummyapi.io/data/v1/post"),
    headers: {
      'accept': 'application/json',
      'app-id': '623c68d39cbe56271eae26a7'
    },
  );
  var jsonData = json.decode((response.body));
  List<Posts> users = [];

  for (var u in jsonData['data']) {
    Posts user = Posts(
      id: u['id'],
      image: u['image'],
      likes: u['likes'],
      tags: u['tags'],
      text: u['text'],
      publishDate: u['publishDate'],
      owner: u['owner'],
    );
    users.add(user);
  }
  return users;
}

class TaskPage1 extends StatefulWidget {
  const TaskPage1({Key? key}) : super(key: key);

  @override
  State<TaskPage1> createState() => _TaskPage1State();
}

class _TaskPage1State extends State<TaskPage1> {
  TextEditingController tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Task 1"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getData();
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.refresh),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: tagsController,
                onChanged: (value) {
                  setState(() {
                    respoundGetByid = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Filter by tags',
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: tagsController.text.isEmpty
                    ? _getData()
                    : _getDataById(tagsController.text),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: const Text("Loading..."),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                            child: snapshot.data.isNotEmpty
                                ? ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              child: Image.network(
                                                snapshot.data[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            left: 10,
                                                            bottom: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Publis Date:\n" +
                                                                (snapshot
                                                                    .data[index]
                                                                    .publishDate)),
                                                            Text("Owner :\n" +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'title'] +
                                                                "." +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'firstName'] +
                                                                " " +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'lastName']),
                                                            Text("Tags : " +
                                                                snapshot
                                                                    .data[index]
                                                                    .tags
                                                                    .toString()),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                                Container(
                                                  width: 50,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 20,
                                                      ),
                                                      Text(snapshot
                                                          .data[index].likes
                                                          .toString()),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              child: Image.network(
                                                snapshot.data[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            left: 10,
                                                            bottom: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Publis Date:\n" +
                                                                (snapshot
                                                                    .data[index]
                                                                    .publishDate)),
                                                            Text("Owner :\n" +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'title'] +
                                                                "." +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'firstName'] +
                                                                " " +
                                                                snapshot
                                                                        .data[index]
                                                                        .owner[
                                                                    'lastName']),
                                                            Text("Tags : " +
                                                                snapshot
                                                                    .data[index]
                                                                    .tags
                                                                    .toString()),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                                Container(
                                                  width: 50,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 20,
                                                      ),
                                                      Text(snapshot
                                                          .data[index].likes
                                                          .toString()),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }))
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
