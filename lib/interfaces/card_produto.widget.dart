import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/domain/item_finalizadora.domain.dart';

class CardProdutoWidget extends StatelessWidget {
  final String icone;
  final String descricao;
  int id;
  final String preco;

  CardProdutoWidget(
      {Key? key,
      required this.icone,
      required this.descricao,
      required this.id,
      required this.preco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4,
                    offset: const Offset(0, 4)),
              ]),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset('assets/svgs/$icone.svg'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 80,
                        child: Text(
                          descricao,
                          style: const TextStyle(fontSize: 18),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
              Positioned(
                right: -10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFC2F4F1),
                  ),
                  child: Text(
                    preco,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
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
              '0$id',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
