import 'package:flutter/material.dart';

class ItemFinalizadoraWidget extends StatelessWidget {

  final String valor;

  const ItemFinalizadoraWidget({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4,
                offset: const Offset(0, 4)),
          ]),
      child: Text(
        style: const TextStyle(
          fontSize: 18
        ),
        valor,
      ),
    );
  }
}
