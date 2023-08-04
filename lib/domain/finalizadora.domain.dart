import 'package:untitled/domain/item_finalizadora.domain.dart';

class FinalizadorasCupom{

  List<ItemFinalizadora> finalizadoras = [];

  void adicionarFinalizadora(ItemFinalizadora itemFinalizadora){
    finalizadoras.add(itemFinalizadora);
  }

  double calcularValorPago(){
    double valorPago = 0;
    for(ItemFinalizadora finalizadora in finalizadoras){
      valorPago += finalizadora.valor;
    }
    return valorPago;
  }
}