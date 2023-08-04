import 'package:untitled/domain/cupom.domain.dart';

abstract class CheckoutState{

  Cupom? cupom = null;


  void redesenharTela();

  void mudarTela();

  void mensagemSucesso();
}