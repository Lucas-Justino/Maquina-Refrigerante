import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/application/component/checkout.component.dart';
import 'package:untitled/application/repo/finalizadora_repo.dart';
import 'package:untitled/application/state/checkout.state.dart';
import 'package:untitled/domain/cupom.domain.dart';
import 'package:untitled/domain/item_finalizadora.domain.dart';
import 'package:untitled/interfaces/buttons/button.widget.dart';
import 'package:untitled/interfaces/item_finalizadora.widget.dart';

import 'buttons/button_pagar_finalizadora.widget.dart';
import 'buttons/button_voltar.widget.dart';

class FinalizadoraWidget extends StatelessWidget {
  final List<ItemFinalizadora> finalizadorasDisponiveis;
  final Cupom cupom;
  final CheckoutComponent checkoutComponent;

  FinalizadoraWidget({
    Key? key,
    required this.finalizadorasDisponiveis,
    required this.cupom,
    required this.checkoutComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 452,
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
          Wrap(
            spacing: 30,
            runSpacing: 20,
            clipBehavior: Clip.hardEdge,
            children: [
              for (int i = 0; i < finalizadorasDisponiveis.length; i++)
                GestureDetector(
                    onTap: () => {
                          checkoutComponent.adicionarFinalizadora(
                              finalizadorasDisponiveis[i].id, cupom),
                          // cupom.mostrarFinalizadoras(cupom),
                          // print(cupom.calcularValorPago()),
                        },
                    child: ItemFinalizadoraWidget(
                        valor: ItemFinalizadora.obterValorFormatado(
                            finalizadorasDisponiveis[i].valor))),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonVoltarWidget(
                widgets: [
                  const SizedBox(
                    width: 55,
                  ),
                  SvgPicture.asset('assets/svgs/setavoltar.svg'),
                ],
                width: 150,
                height: 60,
                aoPressionar: () {
                  checkoutComponent.mudarTela();
                },
              ),
              ButtonPagarFinalizadoraWidget(
                widgets: [
                  const Text(
                    'Pagar',
                    style: TextStyle(color: Color(0xFF625B71), fontSize: 18),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  Text(
                    ItemFinalizadora.obterValorFormatado(cupom.calcularValorPago()),
                    style: const TextStyle(color: Color(0xFF625B71), fontSize: 18),
                  )
                ],
                width: 230,
                height: 60,
                checkoutComponent: checkoutComponent,
                cupom: cupom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
