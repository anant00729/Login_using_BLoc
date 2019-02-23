import 'dart:async';


mixin Validators{

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
      if(password.length > 5){
        sink.add(password);
      }else {
        sink.addError('Please enter the password with lenght more than five chracters');
      }
    }
  );
}




