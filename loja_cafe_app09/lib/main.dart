import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Container,
        IconButton,
        Icons,
        Key,
        MaterialApp,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/widgets.dart';

import 'criar_conta.dart';
import 'login.dart';

Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/criar_conta': (context) => CriarContaPage(),
        '/principal': (context) => PrincipalPage(),
      },
    ),
  );
}

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      backgroundColor: Colors.brown.shade100,
      body: Container(),
    );
  }
}
