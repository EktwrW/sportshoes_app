import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportshoes_app/src/models/zapatilla_model.dart';
import 'package:sportshoes_app/src/pages/zapatilla_desc_page.dart';

class ZapatillaSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatillaSizePreview({this.fullScreen = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ZapatillaDescPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 6 : 30,
          vertical: (this.fullScreen) ? 3 : 1,
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 350 : 400,
          decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: (!this.fullScreen)
                  ? BorderRadius.circular(50)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
          child: ListView(
            children: <Widget>[
              //Zapato con su sombra
              _ZapatillaConSombra(),

              if (!this.fullScreen)
                _ZapatillasTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatillasTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatillaCaja(7),
          _TallaZapatillaCaja(7.5),
          _TallaZapatillaCaja(8),
          _TallaZapatillaCaja(8.5),
          _TallaZapatillaCaja(9),
          _TallaZapatillaCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatillaCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatillaCaja(
    this.numero,
  );

  @override
  Widget build(BuildContext context) {
    final zapatillaModel = Provider.of<ZapatillaModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatillaModel =
            Provider.of<ZapatillaModel>(context, listen: false);
        zapatillaModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (this.numero == zapatillaModel.talla)
                ? Colors.white
                : Colors.orange[300],
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: (this.numero == zapatillaModel.talla)
                ? Colors.orangeAccent[200]
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              if (this.numero == zapatillaModel.talla)
                BoxShadow(
                    color: Colors.deepOrangeAccent[200],
                    blurRadius: 5,
                    offset: Offset(0, 2)),
            ]),
      ),
    );
  }
}

class _ZapatillaConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatillaModel = Provider.of<ZapatillaModel>(context);

    return FadeIn(
      duration: Duration(milliseconds: 300),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 00, right: 30, child: _ZapatillaSombra()),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: FadeIn(
              child: Image(
                image: AssetImage(zapatillaModel.assetImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ZapatillaSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.10,
      child: Container(
        width: 260,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(2000),
            ),
            boxShadow: [
              BoxShadow(color: Colors.deepOrangeAccent[200], blurRadius: 50)
            ]),
      ),
    );
  }
}
