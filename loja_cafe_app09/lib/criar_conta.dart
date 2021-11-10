import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        FontWeight,
        Icon,
        Icons,
        InputDecoration,
        Key,
        ListView,
        MainAxisAlignment,
        Navigator,
        OutlinedButton,
        Row,
        Scaffold,
        ScaffoldMessenger,
        SizedBox,
        SnackBar,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextField,
        TextStyle,
        Widget;

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Café Store'),
          centerTitle: true,
          backgroundColor: Colors.brown),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('criar'),
                    onPressed: () {
                      criarConta(
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                      );
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      exibirmsg('Usuário criado com sucesso!');
      Navigator.pop(context);
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        exibirmsg('ERRO: O email informado já está em uso!');
      } else {
        exibirmsg('ERRO: ${erro.message}');
      }
    });
  }

  void exibirmsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: msg,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
