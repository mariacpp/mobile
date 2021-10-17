


import 'package:app04carros/widget_carro.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carros')),
      body: SingleChildScrollView(  //Scroll View - Barra de Rolagem
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              WidgetCarro('Audi','Q8','lib/imagens/audi_q8.jpg'),
              WidgetCarro('Audi','R8','lib/imagens/audi_r8.jpg'),
              WidgetCarro('BMW','M2','lib/imagens/bmw_m2.jpg'),
              WidgetCarro('Ferrari','488','lib/imagens/ferrari_488.jpg'),
              WidgetCarro('Lamborghini','Huracan','lib/imagens/lamborghini_huracan.jpg'),
              WidgetCarro('Lamborghini','Urus','lib/imagens/lamborghini_urus.jpg'),
              WidgetCarro('Maserati','GTS','lib/imagens/maserati_gts.jpg'),
            ],
          ) ,
          ),
      )
    );
  }
}
