import 'package:untitled/application/repo/produto_repo.dart';
import 'package:untitled/domain/produto.domain.dart';
import 'package:untitled/domain/tipo_produto.domain.dart';

class ProdutoMemoriaRepo implements ProdutoRepo {
  static ProdutoRepo? repo;

  List<Produto> produtosDisponiveis = [
    const Produto(1, 'COCA 350ml', TipoProduto.LATA, 4.00),
    const Produto(2, 'COCA 600ml', TipoProduto.GARRAFA, 7.00),
    const Produto(3, 'GUARANÁ 350ml', TipoProduto.LATA, 4.00),
    const Produto(4, 'GUARANÁ 600ml', TipoProduto.GARRAFA, 6.00),
    const Produto(5, 'FANTA 350ml', TipoProduto.LATA, 3.00),
    const Produto(6, 'FANTA 600ml', TipoProduto.GARRAFA, 6.00),
  ];

  static ProdutoRepo instanciar() {
    return repo ??= ProdutoMemoriaRepo();

    // if(repo == null)
    //   repo = ProdutoMemoriaRepo();
  }

  @override
  List<Produto> obterProdutosDisponiveis() {
    return produtosDisponiveis;
  }

  @override
  Produto obterProdutoID(int idProduto) {
    return produtosDisponiveis[idProduto - 1]; //PODE DAR ERRO NO -1
  }
}
