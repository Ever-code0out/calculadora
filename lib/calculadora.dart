import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final String _limpar = "Limpar";
  String _expressao = "";
  String _resultado = "";

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == _limpar) {
        _expressao = '';
        _resultado = '';
      } else if (valor == '=') {
        _calcularResultado();
      } else {
        _expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    try {
      _resultado = _expressao.split("=").last;
      _resultado = _avaliarExpressao(_expressao).toString();
    } catch (e) {
      _resultado = "Erro";
    }
  }

  double _avaliarExpressao(String expressao) {
    expressao = expressao.replaceAll("X", "*");
    expressao = expressao.replaceAll("÷", "/");
    //Avaliar a expressao com a biblioteca expressions
    ExpressionEvaluator avaliador = const ExpressionEvaluator();
    double resultado = avaliador.eval(Expression.parse(expressao), {});
    return resultado;
  }

  Widget _botao(String valor) {
    return TextButton(
        onPressed: () => _pressionarBotao(valor),
        child: Text(valor, style: const TextStyle(fontSize: 18)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 48, 48, 48),
            child: Text(_expressao, style: const TextStyle(fontSize: 25, color: Colors.white),
          )
        ),
        ),
        //
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 48, 48, 48),
            child: Text(_resultado, style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          )
        ),
        //
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 2,
            children: [
              _botao("1"),
              _botao("2"),
              _botao("3"),
              _botao(" + "),
              _botao("4"),
              _botao("5"),
              _botao("6"),
              _botao(" - "),
              _botao("7"),
              _botao("8"),
              _botao("9"),
              _botao(" ÷ "),
              _botao("0"),
              _botao("."),
              _botao("="),
              _botao(" X "),
            ],
          ),
        ),
        //
        Expanded(
          flex: 1, 
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 7, 226, 255),
            child: _botao(_limpar),
          )
        )
      ],
    );
  }
}
