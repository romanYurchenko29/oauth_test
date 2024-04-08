import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oauth_test/nav_service.dart';
import 'package:oauth_test/uni_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavService.navigatorKey,
      routes: {
        '/': (context) => InitialScreen(),
        '/access': (context) => AccessPage()
      },
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  final routeName = "/";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Initial screen"),
      ),
      body: FutureBuilder(
        future: getCode(),
        builder: (_, snap) => Center(
          child: Text("This is an initial screen\n your code: ${snap.data}"),
        ),
      ),
    );
  }
}

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  final routeName = "/access";

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Access screen"),
      ),
      body: Center(
        child: Text("This is an acces screen^ $args"),
      ),
    );
  }
}

Future<String> getCode() async {
  var dio = Dio();
  var response = await dio.post(
    'https://apps.leader-id.ru/api/v1/oauth/token',
    data: {
      "client_id": "69dac9f2-f8ee-44b9-a478-be44b0be4469",
      "client_secret": "GkNHwtZEVeoLEPqTgUYZ0v7dmMYmRIfJ",
      "grant_type": "client_credentials"
    },
  );
  print("data == ${response.data}");
  return jsonDecode(response.data)["access_code"];
}
