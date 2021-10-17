import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      home: TelaPrincipal(),
    ),
  );
}

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Índice da página que será carregada inicialmente
  var telaAtual = 0;

  //Controlador utilizado para troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: PageView(
        controller: pageController,
        children: [
          TelaHome(), // currentIndex = 0
          TelaPesquisar(), // currentIndex = 1
          TelaNotificacoes(), // currentIndex = 2
          TelaConfiguracoes(), // currentIndex = 3
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),

      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.40),

        selectedFontSize: 16,
        unselectedFontSize: 16,

        iconSize: 40,

        //Index do Botão Selecionado
        currentIndex: telaAtual,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],

        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });

          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}

//
// TELA HOME
//
class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade200,
      child: Center(
        child: Text('Home',
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }
}

//
// TELA Pesquisar
//
class TelaPesquisar extends StatelessWidget {
  const TelaPesquisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade200,
      child: Center(
        child: Text('Pesquisar',
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }
}

//
// TELA Notificações
//
class TelaNotificacoes extends StatelessWidget {
  const TelaNotificacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Center(
        child: Text('Notificações',
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }
}

//
// TELA Configurações
//
class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade200,
      child: Center(
        child: Text('Configurações',
            style: TextStyle(
              fontSize: 36,
            )),
      ),
    );
  }
}
