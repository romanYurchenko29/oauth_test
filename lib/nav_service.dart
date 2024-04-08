import 'package:flutter/material.dart';

class NavService {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static NavigatorState? get navigatorState => navigatorKey.currentState;

  static BuildContext? get context => navigatorState?.overlay?.context;
}
