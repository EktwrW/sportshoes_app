import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sportshoes_app/src/helpers/helpers.dart';
import 'package:sportshoes_app/src/widgets/custom_widgets.dart';

class ZapatillaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return FadeIn(
      duration: Duration(milliseconds: 1000),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        //body: CustomAppbar(texto: 'Para vos'),
        //body: ZapatillaSizePreview(),
        body: Column(
          children: <Widget>[
            CustomAppbar(texto: 'Para vos'),
            SizedBox(height: 0),
            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Hero(tag: 'zapatilla-1', child: ZapatillaSizePreview()),
                  ZapatillaDescripcion(
                    titulo: 'Under Armour HOVR Sonic 40',
                    descripcion:
                        'Flexibilidad, amortiguación y versatilidad. Tecnología Record Sensor™ de UA registra, analiza y almacena de manera virtual, cada métrica de tus carreras, para que sepas exactamente, lo que necesitas para mejorar.',
                  ),
                ],
              ),
            )),
            AgregarCarritoBoton(monto: 180.0),
          ],
        ),
      ),
    );
  }
}
