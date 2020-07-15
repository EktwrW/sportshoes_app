import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportshoes_app/src/models/zapatilla_model.dart';
import 'package:sportshoes_app/src/pages/start_page.dart';
//import 'package:sportshoes_app/src/pages/zapatilla_desc_page.dart';
//import 'package:sportshoes_app/src/pages/zapatilla_page.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => new ZapatillaModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sportshoes App',
      home: StartPage(),
      //home: ZapatillaPage(),
      //home: ZapatillaDescPage(),
    );
  }
}
