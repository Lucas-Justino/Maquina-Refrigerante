import 'package:untitled/application/use_case/checkout_use_case.dart';
import 'package:untitled/domain/cupom.domain.dart';

abstract class CheckoutComponent {

  late CheckoutUseCase useCase;

  void inicializar(CheckoutUseCase useCase){
    this.useCase = useCase;
  }

  void registrarProduto(int id, Cupom cupom) {//QUANDO CLICAR NO CARD DO PRODUTO, SERÁ ENVIADO UM ID
    useCase.registrarProduto(id, cupom);
  }

  void adicionarFinalizadora(int id, Cupom cupom) {
    useCase.adicionarFinalizadora(id, cupom);
  }

  void limpar() {
    useCase.limpar();
  }

  void mudarTela(){
    useCase.mudarTela();
  }

  void mensagemSucesso(){
    useCase.mensagemSucesso();
  }
}
