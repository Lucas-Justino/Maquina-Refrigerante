import 'package:untitled/application/repo/finalizadora_repo.dart';
import 'package:untitled/application/repo/produto_repo.dart';
import 'package:untitled/application/state/checkout.state.dart';
import 'package:untitled/domain/cupom.domain.dart';
import 'package:untitled/domain/item_finalizadora.domain.dart';
import 'package:untitled/domain/item_cupom.domain.dart';
import 'package:untitled/domain/produto.domain.dart';
import 'package:untitled/infrastructure/repo/produto_memoria.repo.dart';

class CheckoutUseCase{

  CheckoutState state;
  ProdutoRepo produtoRepo;
  FinalizadoraRepo finalizadoraRepo;


  CheckoutUseCase(this.state, this.produtoRepo, this.finalizadoraRepo);

  void registrarProduto(int id, Cupom cupom){        //QUANDO CLICAR NO CARD DO PRODUTO, SERÁ ENVIADO UM ID
    Produto produto = ProdutoMemoriaRepo().obterProdutoID(id);
    cupom.registrarProduto(produto);
    state.redesenharTela();
  }

  void adicionarFinalizadora(int id, Cupom cupom){
    ItemFinalizadora finalizadora = finalizadoraRepo.obterFinalizadoraID(id);
    cupom.adicionarFinalizadora(finalizadora);
    state.redesenharTela();
  }

  void limpar(){
    state.cupom = Cupom(1);
    state.redesenharTela();
  }

  void mudarTela() {
    state.mudarTela();
  }

  void mensagemSucesso(){
    state.mensagemSucesso();
  }

}