import 'package:flutter/material.dart';
import 'package:smart_locker/Activities/OpenDoor.dart';

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
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 100, color: Colors.teal),
                    Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black)),                  
                ),  
                Divider(),
                TextFormField(
                  autofocus: true, obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                Divider(height: 50),
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
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.teal, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
              ]))),
    );
  }
}

