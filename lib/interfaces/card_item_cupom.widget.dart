import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/domain/item_finalizadora.domain.dart';

class CardItemCupomWidget extends StatelessWidget {
  final String icone;
  final String descricao;
  final int quantidade;
  final double preco;

  const CardItemCupomWidget(
      {Key? key,
      required this.icone,
      required this.descricao,
      required this.quantidade, required this.preco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
          width: 450,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4,
                    offset: const Offset(0, 4)),
              ]),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset('assets/svgs/$icone.svg')),
                Column(
                  children: [
                    Text(
                      descricao,
                      style: const TextStyle(height: 2),
                    ),
                    Text(
                      ItemFinalizadora.obterValorFormatado(preco),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  child: Text(
                    ItemFinalizadora.obterValorFormatado(preco * quantidade),
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: -7,
            left: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFE8DEF8),
              ),
              child: Text(
                '$quantidade' + 'x',
                style: const TextStyle(fontSize: 16),

              ),
            ))
      ],
    );
  }
}
