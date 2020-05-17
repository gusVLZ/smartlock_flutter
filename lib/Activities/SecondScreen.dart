import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_locker/Models/Album.dart';
import 'package:intl/intl.dart';
import 'package:smart_locker/Utils/Notifications.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class Contact {
  String name;
  DateTime dob;
  String phone = '';
  String email = '';
  String favoriteColor = '';
}

class _SecondScreenState extends State<SecondScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';
  final TextEditingController _controller = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      print('========================================');
      print('Email: ${newContact.name}');
      print('Nascimento: ${newContact.dob}');
      print('Telefone: ${newContact.phone}');
      print('Email: ${newContact.email}');
      print('Cor Favorita: ${newContact.favoriteColor}');
      print('========================================');
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  var newContact = Contact();

  Future<Album> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: Builder(
                builder: (context) =>
                    AppBar(title: Text("Segunda Tela"), actions: [
                      IconButton(
                          icon: Text("M"),
                          splashColor: Colors.black,
                          onPressed: () => Toast(context, "Test"))
                    ]))),
        body: Builder(
            builder: (context) => SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                    key: _formKey,
                    autovalidate: true,
                    child: new ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        new TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            hintText: 'Enter your first and last name',
                            labelText: 'Name',
                          ),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(30)
                          ],
                          validator: (val) =>
                              val.isEmpty ? 'Name is required' : null,
                          onSaved: (val) => newContact.name = val,
                        ),
                        new Row(children: <Widget>[
                          new Expanded(
                              child: new TextFormField(
                            decoration: new InputDecoration(
                              icon: const Icon(Icons.calendar_today),
                              hintText: 'Enter your date of birth',
                              labelText: 'Dob',
                            ),
                            controller: _controller,
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) =>
                                newContact.dob = convertToDate(val),
                          )),
                          new IconButton(
                            icon: new Icon(Icons.more_horiz),
                            tooltip: 'Choose date',
                            onPressed: (() {
                              _chooseDate(context, _controller.text);
                            }),
                          )
                        ]),
                        new TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone),
                            hintText: 'Enter a phone number',
                            labelText: 'Phone',
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            new WhitelistingTextInputFormatter(
                                new RegExp(r'^[()\d -]{1,15}$')),
                          ],
                          onSaved: (val) => newContact.phone = val,
                        ),
                        new TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.email),
                            hintText: 'Enter a email address',
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (val) => newContact.email = val,
                        ),
                        new FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                icon: const Icon(Icons.color_lens),
                                labelText: 'Color',
                                errorText:
                                    state.hasError ? state.errorText : null,
                              ),
                              isEmpty: _color == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: _color,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      newContact.favoriteColor = newValue;
                                      _color = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _colors.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                          validator: (val) {
                            return val != '' ? null : 'Please select a color';
                          },
                        ),
                        new Container(
                            padding:
                                const EdgeInsets.only(left: 40.0, top: 20.0),
                            child: new RaisedButton(
                              child: const Text('Submit'),
                              onPressed: _submitForm,
                            )),
                      ],
                    )))));
  }
}
