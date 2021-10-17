//IMPORTAÇÃO DA BIBLIOTECA
import 'package:flutter/material.dart';

//
//BLOCO PRINCIPAL
//
void main() {
  //iNICIAR A EXECUÇÃO DO APP
  runApp(
      //qual UI será carregada
      MaterialApp(
        title: 'Meu APP',
        home: TelaPrincipal()
      )
  );
}

//
//TELA PRINCIPAL
//
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu APP')),
      body: Center(child: Text('Meu primeiro APP com flutter')
      ),
      
    );
  }
}