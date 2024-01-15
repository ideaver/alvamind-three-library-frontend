import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../utility/console_log.dart';

// App Network Checker
// v.2.0.1
// by Elriz Wiraswara

class NetworkCheckerService extends ChangeNotifier {
  bool isConnected = false;

  StreamSubscription<ConnectivityResult>? _subscription;

  Future<void> initNetworkChecker({
    required NavigatorState navigator,
    Function(bool)? onHasInternet,
  }) async {
    if (!kIsWeb) {
      isConnected = await InternetConnectionChecker().hasConnection;
    } else {
      final res = await http.get(Uri.parse('www.google.com'));
      if (res.statusCode == 200) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    }

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        if (!kIsWeb) {
          isConnected = await InternetConnectionChecker().hasConnection;
        } else {
          final res = await http.get(Uri.parse('www.google.com'));
          if (res.statusCode == 200) {
            isConnected = true;
          } else {
            isConnected = false;
          }
        }

        if (onHasInternet != null) {
          onHasInternet(isConnected);
        }
      } else {
        isConnected = false;
      }

      notifyListeners();

      cl('[NetworkCheckerService].isConnected = $isConnected ');
    });
  }

  void cancelSubs() {
    _subscription?.cancel();
  }
}
