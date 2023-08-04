import 'package:untitled/domain/tipo_produto.domain.dart';

import '../../domain/produto.domain.dart';

abstract class ProdutoRepo{


  List<Produto> obterProdutosDisponiveis();


  Produto obterProdutoID(int idProduto);

}