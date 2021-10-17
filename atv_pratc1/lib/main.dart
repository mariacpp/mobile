import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cadastro',
    home: Cadastro(),
  ));
}

class Dados {
  final String titulo;
  final String autor;
  final String editora;
  Dados(this.titulo, this.autor, this.editora);
}

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var titulo = TextEditingController();
  var autor = TextEditingController();
  var editora = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de livro'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                titulo.text = "";
                autor.text = "";
                editora.text = "";
                FocusScope.of(context).unfocus();
              }
            );
          },
        )
      ],
    ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: titulo,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: autor,
                    decoration: InputDecoration(
                      labelText: 'Autor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: TextFormField(
                  controller: editora,
                  decoration: InputDecoration(
                    labelText: 'Editora',
                    border: OutlineInputBorder(),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text('gravar'),
                    onPressed: () {
                      showDialog(
                        context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Sucesso'),
                          content: Text('Livro gravado com sucesso!'),
                          actions: [
                            TextButton(child: Text('ok!'),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
              ),
            ),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: OutlinedButton(
                    child: Text('limpar'),
                    onPressed: () {
                      setState(() {
                        titulo.text = "";
                        autor.text = "";
                        editora.text = "";
                        FocusScope.of(context).unfocus();
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
