// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class UserPhotoWidget extends StatelessWidget {
  final String photoUrl;

  UserPhotoWidget({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20, // Ajuste conforme necessário
      backgroundImage: NetworkImage(photoUrl),
    );
  }
}
