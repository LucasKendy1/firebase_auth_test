// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth_test/photo.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? userGoogle = FirebaseAuth.instance.currentUser;
  User? userFacebook = FirebaseAuth.instance.currentUser;
  UserCredential? userApple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Auth')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () async {
                await AuthService().signOut();
                userGoogle = await AuthService().signInWithGoogle();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo do botão
                  borderRadius: BorderRadius.circular(25), // Borda arredondada
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/google.png', // Caminho para a imagem do Google
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Center(
                        child: userGoogle == null
                            ? Text("Login com o Google")
                            : Text("Logado como ${userGoogle!.displayName}"),
                      ),
                    ),
                    userGoogle != null
                        ? Center(
                            child: UserPhotoWidget(
                                photoUrl: userGoogle?.photoURL ?? ""))
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () async {
                // await AuthService().signOut();
                userFacebook = await AuthService().signInWithFacebook();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo do botão
                  borderRadius: BorderRadius.circular(25), // Borda arredondada
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Center(
                        child: userFacebook == null
                            ? Text("Login com o Facebook")
                            : Text("Logado como ${userFacebook!.displayName}"),
                      ),
                    ),
                    userFacebook != null
                        ? Center(
                            child: UserPhotoWidget(
                                photoUrl: userFacebook?.photoURL ?? ""))
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () async {
                await AuthService().signOut();
                await AuthService().signInWithApple();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo do botão
                  borderRadius: BorderRadius.circular(25), // Borda arredondada
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/apple.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Center(
                        child: userFacebook == null
                            ? Text("Login com a Apple")
                            : Text(
                                "Logado como ${userApple!.user!.displayName}"),
                      ),
                    ),
                    userApple != null
                        ? Center(
                            child: UserPhotoWidget(
                                photoUrl: userApple!.user!.photoURL ?? ""))
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          userGoogle != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Olá, ${userGoogle?.displayName ?? "visitante"}",
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Seu e-mail é ${userGoogle?.email ?? "não informado"}")),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Seu ID é ${userGoogle?.uid ?? "não informado"}")),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
