import 'dart:convert';

import 'package:connect_api/second_page.dart';
import 'package:connect_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> list = [];

  getPost() async {
    String url = 'https://reqres.in/api/users?page=2';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map respnseBody = jsonDecode(response.body);
        List newList = respnseBody['data'];
        for (var element in newList) {
          list.add(User.fromJson(element));
        }
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.isEmpty
          ? const Center(child: Text('Kosong'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                User item = list[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeconPage(
                                imageProfile: item.avatar != null
                                    ? item.avatar!
                                    : 'https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
                                name: item.firstName! + item.lastName!,
                                email: item.email!,
                                id: item.id!)));
                  },
                  title: Text(item.firstName! + item.lastName!),
                  leading: ClipRRect(
                    child: Image.network(
                      // ignore: prefer_if_null_operators
                      item.avatar != null
                          ? item.avatar!
                          : 'https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
