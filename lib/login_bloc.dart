import 'dart:async';

import 'package:login_with_bloc/validator.dart';
import 'package:rxdart/rxdart.dart';




class LoginBLoc extends Object implements BaseBloc{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  StreamTransformer<String, String> emailValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (email, sink){
        if(email.contains("@")){
          sink.add(email);
        }else {
          sink.addError('Please enter the valid email id');
        }
      }
  );

  StreamTransformer<String, String> passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink){
        if(password.length>4){
          sink.add(password);
        }else {
          sink.addError('Please enter the password with lenght more than five chracters');
        }
      }
  );
  //StreamTransformer<String, String> emailValidator;

  Function(String) get emailChange => _emailController.sink.add;
  Function(String) get passwordChange => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);


  Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e,p) => true);

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}


abstract class BaseBloc {
  void dispose();
}