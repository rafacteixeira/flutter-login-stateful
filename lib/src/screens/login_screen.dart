import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "you@example.com",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmailField,
      onSaved: saveEmailField,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "type your password here",
      ),
      obscureText: false,
      validator: validatePasswordField,
      onSaved: savePasswordField,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text("Submit"),
      onPressed: submitFunction,
    );
  }

  void submitFunction() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('Time to POST $email and $password to my API!');
    }
  }

  String validateEmailField(String value) {
    if (!value.contains('@')) {
      return 'please enter a valid email';
    }
    return null;
  }

  String validatePasswordField(String value) {
    if (value.length < 4) {
      return 'password must be at least 4 characters';
    }
    return null;
  }

  void saveEmailField(String value) {
    email = value;
  }

  void savePasswordField(String value) {
    password = value;
  }
}
