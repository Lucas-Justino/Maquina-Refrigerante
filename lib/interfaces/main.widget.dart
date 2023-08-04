import 'package:flutter/material.dart';
import 'package:untitled/application/component/checkout.component.dart';
import 'package:untitled/application/state/checkout.state.dart';
import 'package:untitled/application/use_case/checkout_use_case.dart';
import 'package:untitled/infrastructure/repo/finalizadora_memoria.repo.dart';
import 'package:untitled/infrastructure/repo/produto_memoria.repo.dart';
import 'package:untitled/interfaces/background_cupom.widget.dart';
import 'package:untitled/interfaces/finalizadora.widget.dart';
import 'package:untitled/interfaces/item_cupom.widget.dart';
import 'package:untitled/interfaces/mensagem_sucesso.widget.dart';
import 'background.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with CheckoutComponent, CheckoutState {
  final _produtoRepo = ProdutoMemoriaRepo.instanciar();
  final _finalizadoraRepo = FinalizadoraMemoriaRepo.instanciar();

  int tela = 0;
  int mensagem = 0;

  @override
  void initState() {
    super.initState();
    inicializar(CheckoutUseCase(this, _produtoRepo, _finalizadoraRepo));
    useCase.limpar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset('assets/images/teste.png'),
          ),
          if (mensagem == 1) MensagemSucessoWidget(checkoutComponent: this,),
          const SizedBox(
            width: 85,
          ),
          Column(
            children: [
              Stack(
                children: [
                  const BackgroundCupomWidget(),
                  ItemCupomWidget(
                    cupom: cupom!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              tela == 0
                  ? Background(
                      produtosDisponiveis:
                          _produtoRepo.obterProdutosDisponiveis(),
                      cupom: cupom!,
                      checkoutComponent: this,
                    )
                  : FinalizadoraWidget(
                      finalizadorasDisponiveis:
                          _finalizadoraRepo.obterFinalizadorasDisponiveis(),
                      cupom: cupom!,
                      checkoutComponent: this,
                    ),
            ],
          ),
          const SizedBox(
            width: 80,
          )
        ],
      ),
    );
  }

  @override
  void redesenharTela() {
    setState(() {
      cupom!.itens.itens;
      cupom!.finalizadoras.finalizadoras;
      mensagem = 0;
    });
  }

  @override
  void mudarTela() {
    setState(() {
      if (tela == 0) {
        tela = 1;
      } else {
        tela = 0;
      }
    });
  }

  @override
  void mensagemSucesso() {
    setState((){
      mensagem = 1;
    });
  }
}
