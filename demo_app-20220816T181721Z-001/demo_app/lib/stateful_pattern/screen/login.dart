import 'package:demo_app/stateful_pattern/mixin/user_validator.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return LoginState();
  }
}

///mixin is used 'with' keyword
class LoginState extends State<Login> with CustomValidation {
  //reference to form
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  var controller = new StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Container(
      // MaterialApp(
      //   home: Scaffold(
      //body : Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.transparent,
      )),
      margin: EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            Container(
              margin: EdgeInsets.only(bottom: 16),
            ),
            passwordField(),
            Container(
              margin: EdgeInsets.only(bottom: 16),
            ),
            submitButton(),
          ],
        ),
      ),
      // ),
      // ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: 16
        ),
        alignLabelWithHint: true,
        hintText: 'Email',
        labelText: 'User Email',
        labelStyle: TextStyle(
            fontSize: 16,
            height: .75
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (val) => !isEmail(val!.trim()) ? "Invalid Email" : null,
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: 16
        ),
        alignLabelWithHint: true,
        hintText: 'password',
        labelText: 'User password',
        labelStyle: TextStyle(
            fontSize: 16,
            height: .75
        ),
      ),
      obscureText: true, //for password hiding
      validator: (password) {
        var s = isPasswordValid(password!) ? null : 'Password length should be 6 character';

        return s;
      },
      onSaved: (value) {
        password = value!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {


        ///stream example, not sure if this works
           /* controller.stream.timeout(
                new Duration(seconds: 5),
                onTimeout: (sink) => sink.addError('failed to click')
            )
                .listen((event) {

                  },
                onError: (err) => print(err)
            );*/


        var validate = formKey.currentState!.validate();
        if (validate) {
          //no values
          // print('email $email password $password');
          formKey.currentState!.save();
          //values found after save
          print('\nemail $email \npassword $password');

          ///dart pad example not working 08/09 same as click example
        /*  controller.stream.take(3)
          .where((event) => email == 'singh@gmail.com')
          .listen((event) {
            print('correct mail');
          },
            onDone: () => print('you exhausted your chances'),
            onError: (err) => print(err)

          );*/

        }
      },
      child: Text('Login'),
    );
  }
}
