import 'package:flutter/material.dart';
import 'package:oauth_test/auth_service.dart';
import 'package:oauth_test/nav_service.dart';
import 'package:oauth_webauth/oauth_webauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OAuthWebAuth.instance.init();
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
    //AuthService().getAccessToken();
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
    AuthService.v1(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Initial screen"),
      ),
      body: Center(
        child: Text("This is an initial screen"),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Access screen"),
      ),
      body: Center(
        child: Text("This is an acces screen"),
      ),
    );
  }
}
