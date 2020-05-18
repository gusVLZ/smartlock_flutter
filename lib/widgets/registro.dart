import 'package:flutter/material.dart';
import 'package:smart_locker/Models/Album.dart';
import 'package:intl/intl.dart';
import 'package:smart_locker/Utils/Notifications.dart';
import 'package:http/http.dart' as http;

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class Form {

  String nome;
  String cpf = '';
  String email = '';
  String senha = '';
  String confirm_senha = '';

}
class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             TextFormField(autofocus: true,
            keyboardType: TextInputType.number,
            style: new TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Cadastro",
              labelStyle: TextStyle(color: Colors.black)),
            )
          ]          

        )
      )
    ),
  );
 }
}