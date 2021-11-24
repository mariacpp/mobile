//LOGIN PAGE
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Container(
        padding: EdgeInsets.all(45),
        //color: Colors.yellow.shade300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            //color: Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.grey.shade500,
            ),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(height: 100, child: Image.asset('lib/dlivros.png')),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  //focusColor: Colors.lightGreen[100],
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtSenha,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  focusColor: Colors.lightGreen[100],
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    login(txtEmail.text, txtSenha.text);
                  },
                  child: Text('entrar'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade800,
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black26,
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Não possui uma conta? ',
                    style: TextStyle(color: Colors.grey[500])),
                TextSpan(
                    text: 'Registrar-se',
                    style: TextStyle(color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, 'cadastro');
                      })
              ]))
            ],
          ),
        ),
      ),
    );
  }

  //
  // LOGIN com o Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushReplacementNamed(context, 'generos');
    }).catchError((erro) {
      if (erro.code == 'user-not-found') {
        exibirmsg('ERRO: Usuário não encontrado.');
      } else if (erro.code == 'wrong-password') {
        exibirmsg('ERRO: Senha incorreta!');
      } else if (erro.code == 'invalid-email') {
        exibirmsg('ERRO: Email invalido.');
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
