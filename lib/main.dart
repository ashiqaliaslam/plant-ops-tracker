// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/firebase_options.dart';
import 'package:provider/provider.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'authentication/app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: ((context, child) => const App()),
    ),
  );
}
