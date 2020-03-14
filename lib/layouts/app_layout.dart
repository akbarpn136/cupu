import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:cupu/pages/app_page.dart';
import 'package:cupu/stores/user_store.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cupu App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                final ReactiveModel<UserStore> _user = Injector.getAsReactive<UserStore>(context: context);

                await _auth.signOut();
                _user.setState((state) => state.setLogStatus(false));
              },
            )
          ],
        ),
        body: AppPage(),
      ),
    );
  }
}
