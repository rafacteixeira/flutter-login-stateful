import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
    formKey.currentState.validate();
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
}
