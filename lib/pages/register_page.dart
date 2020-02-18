import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:cupu/stores/user_store.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReactiveModel<UserStore> _userStore = Injector.getAsReactive<UserStore>(context: context);

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("INI HALAMAN REGISTER"),
          RaisedButton(
            child: Text("LOGIN"),
            onPressed: () {
              _userStore.setState((state) => state.setRegisterStatus(false));
            }
          ),
        ],
      ),
    );
  }
}