import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OpenDoor extends StatefulWidget {
  @override
  _OpenDoorState createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {
  String _response = "";
  openDoorSend() async {
    print("opened");
    final http.Response response = await http.get(
        'http://192.168.0.77:3000/api/opendoor');
    print(response);
    setState(() {
      _response = response.body.toString();
    });
    print("end");
  }

  closeDoorSend() async {
    print("closed");
    final http.Response response = await http.get(
        'http://192.168.0.77:3000/api/closedoor');
    print(response);
    setState(() {
      _response = response.body.toString();
    });
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: Builder(
                builder: (context) =>
                    AppBar(title: Text("Abre Porta"), actions: [
                      IconButton(
                        icon: Icon(Icons.cloud_download),
                        splashColor: Colors.black,
                      )
                    ]))),
        body: Builder(
            builder: (context) => SafeArea(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Open Door"),
                        onPressed: openDoorSend,
                      ),
                      RaisedButton(
                        child: Text("Close Door"),
                        onPressed: closeDoorSend,
                      ),
                      Container(
                          color: Colors.red,
                          width: double.infinity,
                          margin: EdgeInsets.all(20),
                          child: Text(_response))
                    ],
                  ),
                )));
  }
}
