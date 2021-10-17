import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tarefas',
    home: PrincipalPage(),
  ));
}

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  //lista dinamica
  var lista = [];
  //retornaar a tarefa adicionada pelo usuário
  var txtTarefa = TextEditingController();

  @override
  void initState() {
    lista.add("Ir ao supermercado");
    lista.add("Comprar ração para o cacorro");
    lista.add("Trocar a lâmpada da cozinha");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView.builder(
          //quantidade de elementos da lista
          itemCount: lista.length,
          //definir a aparencia dos elementos
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.task),
              title: Text(
                lista[index],
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  //remover item da lista
                  setState(() {
                    lista.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tarefa removida com sucesso'),
                      duration: Duration(seconds: 2),
                    ));
                  });
                },
              ),
            );
          },
        ),
      ),
      //
      //ADICIONAR NOVAS TAREFAS
      //
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar tarefa'),
                  content: TextField(
                    controller: txtTarefa,
                    style: TextStyle(fontSize: 22),
                  ),
                  actions: [
                    TextButton(
                      child: Text('ok'),
                      onPressed: () {
                        setState(() {
                          var msg = '';
                          if (txtTarefa.text.isNotEmpty) {
                            lista.add(txtTarefa.text);
                            txtTarefa.clear();
                            msg = 'Tarefa adicionada com sucesso';
                          } else {
                            msg =
                                'Erro: A descrição da tarefa não foi informada.';
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(msg),
                            duration: Duration(seconds: 2),
                          ));
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
