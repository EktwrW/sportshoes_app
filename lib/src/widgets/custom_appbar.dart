import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String texto;

  const CustomAppbar({@required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(top: 25, left: 25, right: 20, bottom: 10),
        child: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Text(texto,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
              Spacer(),
              Icon(Icons.search, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
