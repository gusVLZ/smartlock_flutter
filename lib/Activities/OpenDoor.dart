import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_locker/global.dart' as globals;


class OpenDoor extends StatefulWidget {
  @override
  _OpenDoorState createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {
  String _response = "";
  openDoorSend() async {
    print("opened");
    try {
      final http.Response response =
          await http.get('http://smartusjt.ddns.net:3000/api/opendoor/' + globals.username);
      print(response);
      setState(() {
        _response = response.body.toString();
      });
    } catch (e) {
      print(e);
    }
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: Builder(
                builder: (context) => AppBar(
                    title: Text("Abre Porta"), backgroundColor: Colors.teal))),
        body: Builder(
            builder: (context) => SafeArea(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Ink(
                                width: 400.0,
                                height: 200.0,
                                decoration: const ShapeDecoration(
                                  color: Colors.teal,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  iconSize: 144.0,
                                  icon: Icon(Icons.lock_outline),
                                  color: Colors.white,
                                  onPressed:  openDoorSend,

                                ),
                              ),
                            ),
                          ),
                          // RaisedButton(
                          // child: Text("Open Door"),
                          // color: Colors.green,
                          // onPressed: openDoorSend,
                          // ),
                          /*Flexible(
                            flex: 2,
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.all(20),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 1],
                                  colors: [
                                    Colors.orangeAccent,
                                    Colors.deepOrange
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: FlatButton(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: SizedBox(
                                          // Icon(Icons.folder_open, size: 30),
                                          child:
                                              Icon(Icons.lock_outline, size: 30),
                                        ),
                                      )
                                    ],
                                  ),
                                  onPressed: closeDoorSend,
                                ),
                              ),
                            ),
                          ),*/
                          // RaisedButton(
                          //  child: Text("Close Door"),
                          //  color: Colors.red,
                          //  onPressed: closeDoorSend,
                          //),
                        ],
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                            color: Colors.teal,
                            width: double.infinity,
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Text(_response)),
                      ),
                    ]))));
  }
}
