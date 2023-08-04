import 'package:untitled/domain/item_finalizadora.domain.dart';

abstract class FinalizadoraRepo{

  List<ItemFinalizadora> obterFinalizadorasDisponiveis();

  ItemFinalizadora obterFinalizadoraID(int idFinalizadora);

}