import 'package:flutter/material.dart';
import 'package:untitled/application/component/checkout.component.dart';
import 'package:untitled/domain/cupom.domain.dart';

class ButtonPagarFinalizadoraWidget extends StatelessWidget {

  final List<Widget> widgets;
  final double width;
  final double height;
  final CheckoutComponent checkoutComponent;
  final Cupom cupom;


  const ButtonPagarFinalizadoraWidget({Key? key, required this.widgets, required this.width, required this.height, required this.checkoutComponent, required this.cupom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          onPressed: () => {
            if(cupom.obterValorRestante() <= 0)
              checkoutComponent.mensagemSucesso(),
          },
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            side: const BorderSide(color: Color(0xFFC2F4F1)),
            backgroundColor: const Color(0xFFC2F4F1).withOpacity(0.8),
          ),
          child: Row(
            children: widgets,
          )),
    );
  }
}
