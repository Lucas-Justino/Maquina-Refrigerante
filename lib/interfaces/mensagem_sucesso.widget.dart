import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/application/component/checkout.component.dart';

class MensagemSucessoWidget extends StatelessWidget {

  final CheckoutComponent checkoutComponent;

  const MensagemSucessoWidget({Key? key, required this.checkoutComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4,
                offset: const Offset(0, 4)),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset('assets/svgs/mao2.svg'),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Retire sua bebida',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF625B71),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Confira se todas as suas bebidas estão liberadas, e não esqueça de pegar o troco.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF625B71)),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 52,
            width: 74,
            child: OutlinedButton(
              onPressed: () {
                checkoutComponent.limpar();
                checkoutComponent.mudarTela();
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                side: BorderSide(
                    color: const Color(0xFFEADDFF).withOpacity(0.99)
                ),
                backgroundColor: const Color(0xFFEADDFF).withOpacity(0.15),
              ),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20, color: Color(0xFF6750A4)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
