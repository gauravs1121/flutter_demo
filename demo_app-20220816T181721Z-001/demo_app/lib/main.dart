import 'dart:async';
import 'dart:convert';

import 'package:demo_app/stateful_pattern/model/image_model.dart';
import 'package:demo_app/stateful_pattern/screen/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import own files-> define relative path
///stateful pattern
import 'stateful_pattern/app.dart';

///bloc pattern import
import 'package:demo_app/bloc_pattern/bloc_app.dart';

void main() {
  ///widget code
  // var app =
  // MaterialApp(home: App('Home'));
  // runApp(app);
///widget code with actionbar
  // var app = MaterialApp(
  //   home: Scaffold(
  //     appBar: AppBar (
  //       title: Text('Login'),
  //     ),
  //     body: Login(),
  //   ),
  // );
  //
  // runApp(app);



  ///bloc code

  var app = MaterialApp(home: BlocApp());

  runApp(app);


}



