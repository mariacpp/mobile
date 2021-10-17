import 'package:flutter/material.dart';

class Widgetlivro extends StatelessWidget {
  final String capa;
  final String titulo;
  final String autor;
  final String sinopse;

  const Widgetlivro(this.autor, this.capa, this.sinopse, this.titulo,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar(
      actions: [
        IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop()
          ),
      ],
    );
    return Container(
      width: double.infinity,
      child: Container(
        child: Row(
          children: [
            Image.asset(
              this.capa,
              height: 200,
              width: 100,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              textDirection: TextDirection.ltr,
              children: [
                Container(
                  width: 200,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Título: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600])),
                        TextSpan(
                            text: this.titulo,
                            style: TextStyle(
                              color: Colors.grey[600],
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Autor(a): ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600])),
                        TextSpan(
                            text: this.autor,
                            style: TextStyle(
                              color: Colors.grey[600],
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sinopse: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            )),
                        TextSpan(
                            text: this.sinopse,
                            style: TextStyle(
                              color: Colors.grey[600],
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Alugar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow.shade800,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
