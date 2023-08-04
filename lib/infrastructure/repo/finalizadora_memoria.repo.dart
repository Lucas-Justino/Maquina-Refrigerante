import 'package:untitled/application/repo/finalizadora_repo.dart';
import 'package:untitled/domain/tipo_finalizadora.domain.dart';

import '../../domain/item_finalizadora.domain.dart';

class FinalizadoraMemoriaRepo implements FinalizadoraRepo{

  static FinalizadoraMemoriaRepo? repo;

  final List<ItemFinalizadora> finalizadoraDisponiveis = [
    ItemFinalizadora(1, 0.25, TipoFinalizadora.MOEDA),
    ItemFinalizadora(2, 0.50, TipoFinalizadora.MOEDA),
    ItemFinalizadora(3, 1.00, TipoFinalizadora.MOEDA),
    ItemFinalizadora(4, 2.00, TipoFinalizadora.NOTA),
    ItemFinalizadora(5, 5.00, TipoFinalizadora.NOTA),
    ItemFinalizadora(6, 10.00, TipoFinalizadora.NOTA),
    ItemFinalizadora(7, 20.00, TipoFinalizadora.NOTA),
    ItemFinalizadora(8, 50.00, TipoFinalizadora.NOTA),
    ItemFinalizadora(9, 100.00, TipoFinalizadora.NOTA),
  ];

  static FinalizadoraRepo instanciar(){

    repo ??= FinalizadoraMemoriaRepo();

    return repo!;

  }

  @override
  ItemFinalizadora obterFinalizadoraID(int idFinalizadora) {
    return finalizadoraDisponiveis[idFinalizadora - 1];
  }

  @override
  List<ItemFinalizadora> obterFinalizadorasDisponiveis(){
    return finalizadoraDisponiveis;
  }

}
