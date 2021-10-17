import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'App',
      home: TelaPrincipal(),
    )
  );
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 03'),
        actions: [
          IconButton (
            icon: Icon(Icons.home), onPressed: () {  },)
        ],
        backgroundColor: Colors.black,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 250,
                height: 90,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('A')
                  ],
                  ),
              ),
              Container(
                width: 250,
                height: 90,
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('B')
                  ],
                  ),
              )
            ],
          ),
          Container(
            width: 500,
            height: 382,
            color: Colors.pink,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('C')
                  ],
                  ),
          ),
          Row(
            children: [
              Container(
                width: 250,
                height: 90,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('D')
                  ],
                  ),
              ),
              Container(
                width: 250,
                height: 90,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('E')
                  ],
                  ),
                )
            ],
          )
        ],
      )
    );
  }
}