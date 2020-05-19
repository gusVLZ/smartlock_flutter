import 'package:flutter/material.dart';
import 'package:smart_locker/Models/Album.dart';
import 'package:intl/intl.dart';
import 'package:smart_locker/Utils/Notifications.dart';
import 'package:http/http.dart' as http;
import 'package:smart_locker/Activities/OpenDoor.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             TextFormField(autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(color: Colors.black)),
            ),
            Divider(),
                TextFormField(autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: new TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.black)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.black)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              labelText: "Senha novamente",
              labelStyle: TextStyle(color: Colors.black)),
                ),
                Divider(),   
                ButtonTheme(
                  height:60.0,
                  child: RaisedButton(
                    onPressed: () {
                  Navigator.push(
                      context,MaterialPageRoute(
                          builder: (context) => OpenDoor()));
                },
                  child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.white,
                  )),
          ]          

        )
      )
    ),
  );
 }
}