import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Container,
        FloatingActionButton,
        IconButton,
        Icons,
        Key,
        ListTile,
        MaterialApp,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/widgets.dart';

import 'cadastro.dart';
import 'pages/criar_conta.dart';
import 'pages/login.dart';

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
        '/cadastro': (context) => CadastroPage(),
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
  //REFERENCIAR A COLEÇÃO DO FIRESTORE
  late CollectionReference cafes;

  @override
  void initState() {
    super.initState();
    cafes = FirebaseFirestore.instance.collection('cafes');
  }

  // ESPECIFICAR A APARENCIA DE CADA ELEMENTO DA LISTA
  exibirItemColecao(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];
    return ListTile(
      title: Text(
        nome,
        style: const TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        'R\$ $preco',
        style: const TextStyle(fontSize: 25),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          //APAGR
          cafes.doc(item.id).delete();
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, '/cadastro', arguments: item.id);
      },
    );
  }

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
      //
      //LISTAR DOCUMENTOS DA COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>(
        stream: cafes.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Não foi possivel conectar'));
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final dados = snapshot.requireData;
              return ListView.builder(itemBuilder: (context, index) {
                return exibirItemColecao(dados.docs[index]);
              });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}
