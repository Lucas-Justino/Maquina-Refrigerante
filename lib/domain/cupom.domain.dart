import 'package:untitled/domain/finalizadora.domain.dart';
import 'package:untitled/domain/item_cupom.domain.dart';
import 'package:untitled/domain/item_finalizadora.domain.dart';
import 'package:untitled/domain/itens_cupom.domain.dart';
import 'package:untitled/domain/produto.domain.dart';

class Cupom {

  final int id;
  ItensCupom itens = ItensCupom();
  FinalizadorasCupom finalizadoras = FinalizadorasCupom();

  Cupom(this.id);

  double calcularValorTotal() {
    return itens.calcularValorTotalItens();
  }

  String obterValorTotalFormatado(){
    return "R\$ ${calcularValorTotal().toStringAsFixed(2)}";
  }

  double calcularTroco() {
    double troco = calcularValorPago() - calcularValorTotal();
    if(troco < 0) {
      return 0;
    }
    return troco;
  }

  String obterTrocoFormatado(){
    return "R\$ ${calcularTroco().toStringAsFixed(2)}";
  }

  double calcularValorPago(){
    return finalizadoras.calcularValorPago();

  }

  double obterValorRestante() {
    double valorRestante = calcularValorTotal() - calcularValorPago();
    if(valorRestante > 0){
      return valorRestante;
    }
    return 0;
  }

  String obterValorRestanteFormatado(){
    return "R\$ ${obterValorRestante().toStringAsFixed(2)}";
  }

  void registrarProduto(Produto produto) {
    ItemCupom item = ItemCupom.criar(produto);
    itens.adicionar(item);
  }

  int obterQuantidadeRegistrada(Produto produto){
    ItemCupom? itemCupom = obterItemSeRegistrado(produto);
    if(itemCupom != null){
      return itemCupom.obterQuantidade();
    }
    return 0;
  }

  ItemCupom? obterItemSeRegistrado(Produto produto)=> itens.obterItemSeRegistrado(produto.id);

  void adicionarFinalizadora(ItemFinalizadora itemFinalizadora){
    finalizadoras.adicionarFinalizadora(itemFinalizadora);
  }
}
