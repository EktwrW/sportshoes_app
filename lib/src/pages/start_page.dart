import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sportshoes_app/src/helpers/helpers.dart';
import 'package:sportshoes_app/src/pages/zapatilla_page.dart';
import 'package:sportshoes_app/src/widgets/custom_widgets.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Stack(children: <Widget>[
      FadeIn(
        duration: Duration(milliseconds: 1400),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imgs/UAnegro.jpg'),
                    fit: BoxFit.fill))),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 320, horizontal: 100),
        child: FadeInLeftBig(
          duration: Duration(milliseconds: 1400),
          child: GestureDetector(
            child: BotonNaranja(
              texto: '',
              alto: 40,
              ancho: 220,
              color: Colors.orange[500].withOpacity(0.5),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ZapatillaPage(),
                  ));
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 331, horizontal: 125),
        child: FadeInRightBig(
          duration: Duration(milliseconds: 1400),
          child: Text('HOVR™ Sonic 3',
              style: TextStyle(
                inherit: false,
                fontSize: 16,
                color: Colors.white60,
                fontStyle: FontStyle.normal,
              )),
        ),
      )
    ]);
  }
}
