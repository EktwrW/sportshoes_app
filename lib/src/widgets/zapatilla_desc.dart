import 'package:flutter/material.dart';

class ZapatillaDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ZapatillaDescripcion({
    @required this.titulo,
    @required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                this.titulo,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                this.descripcion,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                    height: 1.4),
              ),
            ]),
      ),
    );
  }
}
