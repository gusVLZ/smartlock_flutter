import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black)),
                )
              ]))),
    );
  }
}
