import 'package:untitled/domain/produto.domain.dart';
import 'package:untitled/domain/tipo_produto.domain.dart';

class ItemCupom{

  final int idProduto;
  final String descricao;
  final double valorUnitario;
  int quantidade;
  final TipoProduto tipo;

  static ItemCupom criar(Produto produto){
    return ItemCupom(produto.id, produto.descricao, produto.preco, produto.tipo, 1);
  }

  ItemCupom(this.idProduto, this.descricao, this.valorUnitario, this.tipo, this.quantidade);

  double calcularValorTotal(){
    return quantidade * valorUnitario;
  }

  void incrementarQuantidade(){
    quantidade++;
  }

  int obterQuantidade(){
    return quantidade;
  }


}