import 'package:flutter/material.dart';

class SeconPage extends StatelessWidget {
  final String imageProfile;
  final String name;
  final String email;
  final int id;
  const SeconPage(
      {super.key,
      required this.imageProfile,
      required this.name,
      required this.email,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageProfile),
            Text(name),
            Text(email),
            Text(id.toString()),
          ],
        ),
      ),
    );
  }
}
