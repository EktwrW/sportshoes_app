import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportshoes_app/src/helpers/helpers.dart';
import 'package:sportshoes_app/src/models/zapatilla_model.dart';
import 'package:sportshoes_app/src/pages/start_page.dart';
import 'package:sportshoes_app/src/widgets/custom_widgets.dart';

class ZapatillaDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return FadeIn(
      duration: Duration(milliseconds: 1000),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                      tag: 'zapatilla-1',
                      child: ZapatillaSizePreview(fullScreen: true)),
                  Positioned(
                      top: 15,
                      left: 5,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 50,
                        ),
                        onPressed: () {
                          cambiarStatusDark();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StartPage()));
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        highlightElevation: 0,
                      )),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: <Widget>[
                  ZapatillaDescripcion(
                      titulo: 'Under Armour HOVR Sonic 40',
                      descripcion:
                          'UA HOVR™ proporciona “sensación de ingravidez” para permitir la recuperación de energía, reduciendo el impacto paso tras paso. La malla de compresión EnergyWeb moldea la espuma UA HOVR™, devolviendo la energía que liberas.'),
                  _MontoComprar(),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: _Colores(),
                  ),
                  _BotonInferior(),
                ],
              )))
            ],
          ),
        ),
      ),
    );
  }
}

class _BotonInferior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonFinal(Icon(
            Icons.favorite_border,
            color: Colors.red,
            size: 30,
          )),
          _BotonFinal(Icon(
            Icons.add_shopping_cart,
            color: Colors.grey[400],
            size: 30,
          )),
          _BotonFinal(Icon(
            Icons.settings,
            color: Colors.grey[400],
            size: 30,
          ))
        ],
      ),
    );
  }
}

class _BotonFinal extends StatelessWidget {
  final Icon icon;
  const _BotonFinal(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: this.icon,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ]));
  }
}

class _Colores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Stack(
          children: <Widget>[
            Positioned(
              left: 105,
              child: _BotonColor(Colors.black, 1, 'assets/imgs/negro.png'),
            ),
            Positioned(
              left: 80,
              child: _BotonColor(Colors.pink[300], 2, 'assets/imgs/rosa.png'),
            ),
            Positioned(
              left: 55,
              child: _BotonColor(Colors.white, 3, 'assets/imgs/blanco.png'),
            ),
            Positioned(
              left: 25,
              child: _BotonColor(
                  Colors.pinkAccent[400], 4, 'assets/imgs/rosado.png'),
            ),
            _BotonColor(Colors.grey[600], 5, 'assets/imgs/gris.png'),
          ],
        )),
        BotonNaranja(
          texto: 'Otros Modelos',
          alto: 35,
          ancho: 115,
          color: Colors.orangeAccent[200],
        )
      ],
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  _BotonColor(
    this.color,
    this.index,
    this.urlImagen,
  );

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(milliseconds: this.index * 200),
      child: GestureDetector(
        onTap: () {
          final zapatillaModel =
              Provider.of<ZapatillaModel>(context, listen: false);
          zapatillaModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoComprar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23.0, right: 5),
      child: Container(
        child: Row(
          children: <Widget>[
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 900),
              from: 8,
              child: BotonNaranja(
                texto: 'Comprar Ahora',
                ancho: 115,
                alto: 35,
                color: Colors.orange[600],
              ),
            )
          ],
        ),
      ),
    );
  }
}
