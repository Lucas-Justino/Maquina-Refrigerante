import 'package:untitled/domain/tipo_finalizadora.domain.dart';

class ItemFinalizadora {

  final int id;
  final TipoFinalizadora tipoFinalizadora;
  final double valor;

  ItemFinalizadora(this.id, this.valor, this.tipoFinalizadora,);

  static String obterValorFormatado(double valor){
    return "R\$ ${valor.toStringAsFixed(2)}";
  }
}