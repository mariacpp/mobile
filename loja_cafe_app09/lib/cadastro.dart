import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: txtNome,
            style: TextStyle(color: Colors.brown, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(color: Colors.brown, fontSize: 22),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: txtPreco,
            style: TextStyle(color: Colors.brown, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Preço',
              labelStyle: TextStyle(color: Colors.brown, fontSize: 22),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text('salvar'),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('cafes').add({
                      'nome': txtNome.text,
                      'preco': txtPreco.text,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
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
        ]),
      ),
    );
  }
}
