import 'package:untitled/domain/item_cupom.domain.dart';
import 'package:untitled/domain/produto.domain.dart';

class ItensCupom{

  List<ItemCupom> itens = [];


  void adicionar(ItemCupom item) {
    ItemCupom? itemRegistrado = obterItemSeRegistrado(item.idProduto);
    if(itemRegistrado != null){
      itemRegistrado.incrementarQuantidade();
    } else{
      itens.add(item);
    }
  }


  double calcularValorTotalItens() {
    double valorTotal = 0;
    for(ItemCupom itemCupom in itens){
      valorTotal += itemCupom.calcularValorTotal();
    }
    return valorTotal;
  }

  ItemCupom? obterItemSeRegistrado(int idProduto){
    for(ItemCupom item in itens){
      if(item.idProduto == idProduto){
        return item;
      }
    }
    return null;
  }

}