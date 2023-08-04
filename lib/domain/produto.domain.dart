import 'package:untitled/domain/tipo_produto.domain.dart';

class Produto{

  final int id;
  final String descricao;
  final TipoProduto tipo;
  final double preco;

  const Produto(this.id, this.descricao, this.tipo, this.preco);

  String obterPrecoFormatado(){
    return "R\$ ${preco.toStringAsFixed(2)}";
  }

}