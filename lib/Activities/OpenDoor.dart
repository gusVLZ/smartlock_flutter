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
    try {
      final http.Response response =
          await http.get('http://192.168.0.77:3000/api/opendoor');
      print(response);
      setState(() {
        _response = response.body.toString();
      });
    } catch (e) {
      print(e);
    }
    print("end");
  }

  closeDoorSend() async {
    print("closed");
    try {
      final http.Response response =
          await http.get('http://192.168.0.77:3000/api/closedoor');
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
                      title: Text("Abre Porta"),
                    ))),
        body: Builder(
            builder: (context) => SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                         height: 40,
                       ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 1],
                            colors: [
                              Color(0xFF4FA800),
                              Color(0XFF6DE800),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Open Door",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Container(
                                  child: SizedBox(
                                    // Icon(Icons.folder_open, size: 30),
                                    child: Icon(Icons.lock_open, size: 30),
                                  ),
                                )
                              ],
                            ),
                            onPressed: openDoorSend,
                          ),
                        ),
                      ),
                      // RaisedButton(
                      // child: Text("Open Door"),
                      // color: Colors.green,
                      // onPressed: openDoorSend,
                      // ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 1],
                            colors: [
                              Color(0xFFCC0000),
                              Color(0XFFFF8787),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Close Door",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Container(
                                  child: SizedBox(
                                    // Icon(Icons.folder_open, size: 30),
                                    child: Icon(Icons.lock_outline, size: 30),
                                  ),
                                )
                              ],
                            ),
                            onPressed: closeDoorSend,
                          ),
                        ),
                      ),
                      // RaisedButton(
                      //  child: Text("Close Door"),
                      //  color: Colors.red,
                      //  onPressed: closeDoorSend,
                      //),
                      Container(
                          color: Colors.blue,
                          width: double.infinity,
                          margin: EdgeInsets.all(20),
                          child: Text(_response)),
                    ],
                  ),
                )));
  }
}
