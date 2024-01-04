// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Auth')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await AuthService().signOut();
                user = await AuthService().signInWithGoogle();
                print(user);
                if (user != null) {
                  print("Usuário logado com sucesso: ${user!.displayName}");
                } else {
                  print("Login com o Google cancelado ou falhou.");
                }
                setState(() {});
              },
              child: Column(
                children: [
                  user == null
                      ? Text("Login com o Google")
                      : Text("Logado como ${user!.displayName}"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
