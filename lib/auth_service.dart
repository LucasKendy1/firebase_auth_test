// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);

      // Acessando informações do usuário
      final User? user = userCredential.user;
      if (user != null) {
        print('Usuário logado com sucesso: ${user.displayName}');
        print('Email: ${user.email}');
        print('UID: ${user.uid}');
        // Adicione aqui qualquer outra informação do usuário que deseja acessar
      } else {
        print('Erro ao obter informações do usuário');
      }
    } catch (e) {
      print('Erro ao fazer login com a Apple: $e');
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) return null; // Usuário cancelou o login

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential authResult = await _auth.signInWithCredential(credential);
      User? user = authResult.user;

      return user;
    } catch (e) {
      print("Erro ao fazer login com o Google: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();

    await _auth.signOut();
  }

  Future<User?> signInWithFacebook() async {
    try {
      // Cria um novo provedor
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      // Adiciona escopo e parâmetros personalizados
      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      // Realiza o login com o Facebook usando signInWithPopup
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);

      // Retorna o usuário do UserCredential
      return userCredential.user;
    } catch (e) {
      // Lida com erros, se houver algum
      print('Erro durante o login com Facebook: $e');
      return null;
    }
  }
}
