import 'dart:async';
import 'package:validators/validators.dart';
class Validators{

  final isPasswordValid = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 6){
        sink.add(password);
      } else {
        sink.addError('Password should be at least 6 characters long');
      }
    }
  );


  final isEmailValid = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(isEmail(email.trim()))
        sink.add(email);
      else
        sink.addError('Invalid Email');
    }
  );

}