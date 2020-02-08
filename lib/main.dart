import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import './layouts/auth_layout.dart';
import 'package:cupu/layouts/app_layout.dart';
import 'package:cupu/layouts/status_layout.dart';
import 'package:cupu/stores/user_store.dart';

void main() => runApp(
  Injector(
    inject: <Inject>[
      Inject<FirebaseUser>.future(() async {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final FirebaseUser _user = await _auth.currentUser();

        return _user;
      }),
    ],
    builder: (BuildContext context) {
      final ReactiveModel<FirebaseUser> _userStore = Injector.getAsReactive<FirebaseUser>(context: context);

      return _userStore.whenConnectionState(
        onIdle: () {
          return StatusLayout(
            message: "Init Cupu App",
          );
        }, 
        onWaiting: () {
          return StatusLayout(
            message: "Loading Cupu App...",
          );
        }, 
        onError: (err) {
          return StatusLayout(
            message: err.message,
          );
        },
        onData: (FirebaseUser user) {
          return Injector(
            inject: <Inject>[
              Inject<UserStore>(() => UserStore()),
            ],
            builder: (BuildContext context) {
              final ReactiveModel<UserStore> _userStore = Injector.getAsReactive<UserStore>(context: context);

              if (user != null || _userStore.state.loggedIn) {
                return AppLayout();
              }

              return AuthLayout();
            },
          );
        },
      );
    },
  )
);
