import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
Color c1 = const Color(0xFFFFFF);
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration:  BoxDecoration(
          image:  DecorationImage(
            image:  AssetImage("asserts/back.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child:Scaffold(
        
        appBar: AppBar(
          title: Text('Qrcode Scanner'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: SelectableText(
                  barcode,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //Text('RESULT  $barcode'),
              RaisedButton(
                autofocus: true,
                  elevation: 4.0,
                  splashColor: Colors.indigoAccent,
                  onPressed: _scan, child: Text("Scan")
              ),
              RaisedButton(
                elevation: 4.0,
                autofocus: true,
                  splashColor: Colors.indigoAccent,
                  onPressed: _scanPhoto, child: Text("Scan Photo")),
            ]
        ),
        ),
      ),),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    setState(() => this.barcode = barcode);
  }

}