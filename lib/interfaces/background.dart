import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/application/component/checkout.component.dart';
import 'package:untitled/domain/cupom.domain.dart';
import 'package:untitled/domain/produto.domain.dart';
import 'package:untitled/domain/tipo_produto.domain.dart';

import 'buttons/button.widget.dart';
import 'card_produto.widget.dart';

class Background extends StatelessWidget {
  final List<Produto> produtosDisponiveis;
  late String icone;
  final Cupom cupom;
  final CheckoutComponent checkoutComponent;

  Background({
    Key? key,
    required this.produtosDisponiveis,
    required this.cupom,
    required this.checkoutComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 522,
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
          Flexible(
            flex: 2,
            child: Wrap(
              clipBehavior: Clip.hardEdge,
              runSpacing: 20,
              spacing: 20,
              children: [
                for (int i = 0; i < produtosDisponiveis.length; i++)
                  if (TipoProduto.GARRAFA == produtosDisponiveis[i].tipo)
                    GestureDetector(
                      onTap: () => {
                        checkoutComponent.registrarProduto(
                            produtosDisponiveis[i].id, cupom),
                        // cupom.mostrarCupom(cupom),
                      },
                      child: CardProdutoWidget(
                        icone: 'garrafa',
                        descricao: produtosDisponiveis[i].descricao,
                        id: produtosDisponiveis[i].id,
                        preco: produtosDisponiveis[i].obterPrecoFormatado(),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () => {
                        checkoutComponent.registrarProduto(
                            produtosDisponiveis[i].id, cupom),
                        // cupom.mostrarCupom(cupom)
                      },
                      child: CardProdutoWidget(
                        icone: 'lata',
                        descricao: produtosDisponiveis[i].descricao,
                        id: produtosDisponiveis[i].id,
                        preco: produtosDisponiveis[i].obterPrecoFormatado(),
                      ),
                    )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  widgets: [
                    SvgPicture.asset('assets/svgs/lixo.svg'),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Limpar',
                      style: TextStyle(color: Color(0xFF625B71), fontSize: 18),
                    ),
                  ],
                  width: 150,
                  height: 60,
                  aoPressionar: () {
                    checkoutComponent.limpar();
                  },
                ),
                ButtonWidget(
                    widgets: [
                      const Text('Pagamento',
                          style: TextStyle(
                            color: Color(0xFF625B71),
                            fontSize: 18,
                          )),
                      const SizedBox(width: 120),
                      SvgPicture.asset('assets/svgs/seta.svg'),
                    ],
                    width: 250,
                    height: 60,
                    aoPressionar: () {
                      checkoutComponent.mudarTela();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
