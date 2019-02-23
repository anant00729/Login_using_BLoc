import 'package:flutter/material.dart';
import 'package:login_with_bloc/login_bloc.dart';


void main() => runApp(Home());


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Login form with BLoc",
      home : Login(),
      debugShowCheckedModeBanner: false,

    );
  }
}




class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginBLoc _b = LoginBLoc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login with BLoc Pattern'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(16),),
              StreamBuilder(
                stream: _b.email,
                builder: (context, snap){
                  return TextField(
                    onChanged: _b.emailChange,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        labelText: 'Email',
                        errorText: snap.error
                    ),
                  );
                }
              ),
              Padding(padding: const EdgeInsets.all(8),),
              StreamBuilder(
                stream: _b.password,
                builder: (context, snap){
                  return TextField(
                    onChanged: _b.passwordChange,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        labelText: 'Password',
                        errorText: snap.error
                    ),
                  );
                }

              ),
              Padding(padding: const EdgeInsets.all(8),),
              StreamBuilder(
                stream: _b.submitCheck,
                builder: (context, snap){
                  //print('snap.hasData ${snap.hasData}');
                 return FlatButton(
                   disabledColor: Colors.black,
                   disabledTextColor: Colors.white,
                   onPressed: snap.hasData ? () => changePage(context) : null, child: Text('Login', style: TextStyle(color: Colors.white)), color: Colors.blue,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  changePage(BuildContext context) {
    final snackBar = SnackBar(content: Text('Take me In'));

// Find the Scaffold in the Widget tree and use it to show a SnackBar
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
