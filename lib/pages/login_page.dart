import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../components/ti_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TiComponent(
              label: "Email",
              hint: "user@contoh.com",
              keyboardType: TextInputType.emailAddress,
              validate: (String value) {
                if (value.isEmpty) {
                  return "Email diperlukan";
                } else if (!EmailValidator.validate(value)) {
                  return "Email tidak valid";
                }else {
                  return null;
                }
              },
              change: (String value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TiComponent(
              label: "Password",
              hint: "Kata kunci",
              isPassword: true,
              validate: (String value) {
                if (value.isEmpty) {
                  return "Password diperlukan";
                } else {
                  return null;
                }
              },
              change: (String value) {
                password = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "MASUK",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("Email: $email \nPassword: $password");
                    }
                  },
                ),
                FlatButton(
                  child: Text(
                    "Pengguna baru?",
                    style: TextStyle(
                      color: Colors.black45
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
