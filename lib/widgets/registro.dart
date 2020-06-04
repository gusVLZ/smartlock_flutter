import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_locker/Activities/OpenDoor.dart';
import 'package:flutter/services.dart';
import 'package:smart_locker/Utils/Notifications.dart';
import 'package:smart_locker/Models/User.dart';
import 'package:http/http.dart' as http;

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var userLog = new User();

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      Toast(_scaffoldKey.currentContext,
          'O formulário não está certo, por gentileza verifique');
    } else {
      form.save(); //This invokes each onSaved event

      print('========================================');
      print('Username: ${userLog.username}');
      print('Password: ${userLog.password}');
      print('Encode: ${jsonEncode(userLog)}');
      print('========================================');
      Toast(_scaffoldKey.currentContext, 'Enviado com sucesso');

      postUser(userLog).then((value) {
        if (value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OpenDoor()));
        } else {
          Toast(_scaffoldKey.currentContext, "Credenciais Invalidas");
        }
      });
    }
  }

  Future<bool> postUser(User body) async {
    final response =
        await http.post('http://gusvlz.ddns.net:3000/api/cadastrar',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Builder(
            builder: (context) => SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: new Form(
                              key: _formKey,
                              autovalidate: true,
                              child: ListView(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.add_circle,
                                        size: 100, color: Colors.teal),
                                    Divider(),
                                    TextFormField(
                                      autofocus: true,
                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      decoration: InputDecoration(
                                          labelText: "Usuário",
                                          labelStyle:
                                              TextStyle(color: Colors.black)),
                                      validator: (val) => val.isEmpty
                                          ? 'É necessario um Usuário'
                                          : null,
                                      onSaved: (val) => userLog.username = val,
                                    ),Divider(),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      decoration: InputDecoration(
                                          labelText: "Cargo",
                                          labelStyle:
                                              TextStyle(color: Colors.black)),
                                      validator: (val) => val.isEmpty
                                          ? 'É necessario uma Cargo'
                                          : null,
                                      onSaved: (val) => userLog.cargo = val,
                                    ),Divider(),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      decoration: InputDecoration(
                                          labelText: "E-mail",
                                          labelStyle:
                                              TextStyle(color: Colors.black)),
                                      validator: (val) => val.isEmpty
                                          ? 'É necessario uma e-mail'
                                          : null,
                                      onSaved: (val) => userLog.email = val,
                                    ),
                                    Divider(),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      decoration: InputDecoration(
                                          labelText: "Senha",
                                          labelStyle:
                                              TextStyle(color: Colors.black)),
                                      validator: (val) => val.isEmpty
                                          ? 'É necessario uma Senha'
                                          : null,
                                      onSaved: (val) => userLog.password = val,
                                    ),
                                    Divider(),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      decoration: InputDecoration(
                                          labelText: "Senha novamente",
                                          labelStyle:
                                              TextStyle(color: Colors.black)),
                                      validator: (val) => val.isEmpty && val != userLog.password
                                          ? 'Senhas divergem'
                                          : null,
                                      onSaved: (val) => userLog.password = val,
                                    ),
                                    Divider(),
                                    Container(
                                      height: 40,
                                      margin: EdgeInsets.all(80),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [0.4, 1],
                                          colors: [
                                            Color(0XFF2B9688),
                                            Color(0xFF88D8AC),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: SizedBox.expand(
                                        child: FlatButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Entrar",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          onPressed: _submitForm,
                                        ),
                                      ),
                                    ),
                                    // ButtonTheme(
                                    //   height: 60.0,
                                    //   child: RaisedButton(
                                    //     onPressed: _submitForm,
                                    //     child: Text(
                                    //       "Entrar",
                                    //       style: TextStyle(color: Colors.white),
                                    //     ),
                                    //     color: Colors.teal,
                                    //     shape: new RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             new BorderRadius.circular(
                                    //                 30.0)),
                                    //   ),
                                    // ),
                                  ])))),
                )));
  }
}
