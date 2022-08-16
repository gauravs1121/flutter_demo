import 'dart:async';
import 'package:demo_app/bloc_pattern/utils/validators.dart';

///mixin is allowed without extending 'Object' class i.e. using 'Extend' keyword
class Bloc with Validators {

  ///adding _ makes field private
  final _emailController = StreamController<String>();

  ///getter
  get addEmail => _emailController.sink.add; //add email
  get email => _emailController.stream.transform(isEmailValid); //retrieve email

  final _passwordController = StreamController<String>();

  ///getter
  Function(String) get addPassword =>
      _passwordController.sink.add; // datatype to be added using Function(<T>)
  Stream<String> get password =>
      _passwordController.stream.transform(isPasswordValid); // datatype to be returned using Stream<T>

  dispose(){
    _emailController.close();
    _passwordController.close();
  }


  submitLogin(){

    print('email ${email} password $password');
  }
}

///single global instance
//  Bloc bloc =new Bloc();
