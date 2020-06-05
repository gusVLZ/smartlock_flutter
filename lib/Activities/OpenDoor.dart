import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_locker/global.dart' as globals;
import 'package:smart_locker/Utils/Notifications.dart';

class OpenDoor extends StatefulWidget {
  @override
  _OpenDoorState createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {
  String _response = "";
  final GlobalKey<ScaffoldState> _builderKey = new GlobalKey<ScaffoldState>();
  openDoorSend() async {
    print("opened");
    try {
      final http.Response response = await http.get(
          'http://smartusjt.ddns.net:3000/api/opendoor/' + globals.username);
      print(response);
      Toast(_builderKey.currentContext, response.body.toString());
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
                    title: Text("Abree Porta"), backgroundColor: Colors.teal))),
        body: Builder(
            key: _builderKey,
            builder: (context) => SafeArea(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                                child: RaisedButton(
                                  padding: EdgeInsets.all(30),
                                  color:Colors.teal,
                                  elevation: 10,
                              onPressed: openDoorSend,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.lock_outline,
                                size: 144.0,
                                color: Colors.white,
                              ),
                            )
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
                    ]))));
  }
}
