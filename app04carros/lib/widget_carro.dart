import 'package:flutter/material.dart';

class WidgetCarro extends StatelessWidget {

  //Atributos para receber informações
    final String marca; 
    final String modelo;  // final - obrigatório atribuir alguma informação
    final String foto;

  const WidgetCarro(this.marca,this.modelo,this.foto,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25), //margens (externa)
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15), //espaçamento (interna)
      decoration: BoxDecoration( //decoração
        border: Border.all(
          color: Colors.grey.shade800,
          width: 1,
          
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [Colors.grey.shade300,Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        color: Colors.grey[300],
      ) ,
      width:MediaQuery.of(context).size.width*0.90,
      //height: 380,
      //color: Colors.blue[100], -- não pode ter se houver um 'decoration'
      child: Column(
        children: [
          Text(this.marca, style: 
          TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            ),
            ),
          Text(this.modelo,style:
            TextStyle(
              fontSize: 32,
              fontStyle: FontStyle.italic,
            )
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              ),
            ),
            child: Image.asset(this.foto)),
        ],
        )
    );
  }
}
