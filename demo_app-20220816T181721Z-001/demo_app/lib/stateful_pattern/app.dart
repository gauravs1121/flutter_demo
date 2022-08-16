import 'package:demo_app/stateful_pattern/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform, exit;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'model/image_model.dart';

//widget contains functions and different instance variables that assist in showing some content on device stateful_pattern.screen
//statelessWidget doesn't contain it's own data(state)
//statefulWidget maintain it's own data(state)

class App extends StatefulWidget {
  App(this.title);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return CustomAppBar(title);
  }
}

class CustomAppBar extends State<App> {
  //assignment at time of constructor creation
  CustomAppBar(this.title);

  final String title;

  //do not declare variable inside build it won't update the ui or change the variable value
  var counter = 0;
  List<ImageModel> imageList = [];


  fetchImage() async {
    /**
     * API Calling
     * add http: ^0.13.3 add to pubspec.yaml
     * click on pub get
     */
    counter++;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));

    print('!!!! ${response.request!.url.toString()}');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      imageList.add(imageModel);
    });
    print(imageModel);
  }

  //'build' method is required to return
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ImageList(imageList),
      appBar: AppBar(
          title: Text(title),
          //new IconButton(
          //   icon: new Icon(Icons.arrow_back, color: Colors.orange),
          //   onPressed: () => Navigator.of(context).pop(),
          // )
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).maybePop();
                // Navigator.of(context, rootNavigator: true).pop(context);
                // Navigator.pushReplacementNamed(context, '/route');
                // SystemNavigator.pop();
                // Navigator.pop(context,true);// It worked for me instead of above line
                // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                /**
                     * not a recommended way to exit application in either ios or android
                     * */
                // exit(0);
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  /**26 aug
                       *exit is not required in iOS app. Users should spend as much time as possible
                       * only way to exit app is if they press home or swipe up
                       */
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  // MinimizeApp.minimizeApp();
                  // exit(0);
                  // Navigator.of(context).pop();
                  // SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                  // SystemNavigator.pop();
                  // MoveToBackground.moveTaskToBack();

                }
              }),
          centerTitle: false),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue, // fab icon bg color
        child: Icon(Icons.add, color: Colors.white54),
        onPressed: fetchImage, /*function referencing*/
        // onPressed: (){
        //   setState(() {
        // counter = counter + 1;
        // print(counter);
        // });
        // },
      ),
    ));
  }
}
