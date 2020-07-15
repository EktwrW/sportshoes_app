import 'package:flutter/material.dart';
import 'package:sportshoes_app/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  const AgregarCarritoBoton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.10),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              '\$$monto',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            BotonNaranja(texto: 'Agregar al Carrito')
          ],
        ),
      ),
    );
  }
}
