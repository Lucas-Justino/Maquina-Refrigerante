import 'package:flutter/material.dart';
import 'package:untitled/domain/cupom.domain.dart';
import 'package:untitled/domain/tipo_produto.domain.dart';
import 'package:untitled/interfaces/card_item_cupom.widget.dart';

class ItemCupomWidget extends StatelessWidget {
  final Cupom cupom;
  double valorTotal = 0;

  ItemCupomWidget({Key? key, required this.cupom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          height: 233,
          width: 522,
          decoration: const BoxDecoration(),
          child: Container(
            // color: Colors.black,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              clipBehavior: Clip.none,
              children: [
                Wrap(
                  runSpacing: 15,
                  children: [
                    for (int i = 0; i < cupom.itens.itens.length; i++)
                      if (TipoProduto.GARRAFA ==  cupom.itens.itens[i].tipo)
                        CardItemCupomWidget(
                          icone: 'garrafa',
                          descricao: cupom.itens.itens[i].descricao,
                          quantidade: cupom.itens.itens[i].quantidade,
                          preco: cupom.itens.itens[i].valorUnitario,
                        )
                      else
                        CardItemCupomWidget(
                          icone: 'lata',
                          descricao: cupom.itens.itens[i].descricao,
                          quantidade: cupom.itens.itens[i].quantidade,
                          preco: cupom.itens.itens[i].valorUnitario,
                        )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          // padding: EdgeInsets.symmetric(vertical: 100),
          width: 450,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    'Falta',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                  Text(
                    'Troco',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                width: 300,
              ),
              Column(
                children: [
                  Text(
                    cupom.obterValorTotalFormatado(),
                    style: const TextStyle(fontSize: 22),
                  ),
                  Text(
                    cupom.obterValorRestanteFormatado(),
                    style: const TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                  Text(
                    cupom.obterTrocoFormatado(),
                    style: const TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
