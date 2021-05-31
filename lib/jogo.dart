import 'package:flutter/material.dart';
import 'dart:math';
 class jogo extends StatefulWidget {
   @override
   _jogoState createState() => _jogoState();
 }
 
 class _jogoState extends State<jogo> {
    var _imagenApp = AssetImage("imagem/padrao.png");
    var _mensagem = "Esolha uma opçao a baixo";

    void opcaoSelecionada(String escolhadoUsuario){
      var opcoes = ["pedra","papel","tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];

      //Escolha do app
      switch(escolhaApp){
        case "pedra" :
          setState(() {
            this._imagenApp = AssetImage("imagem/pedra.png");
          });

          break;
        case "tesoura" :
          setState(() {
            this._imagenApp = AssetImage("imagem/tesoura.png");
          });

          break;
        case "papel" :
          setState(() {
            this._imagenApp = AssetImage("imagem/papel.png");
          });

          break;
      }
       //validação
      if( (escolhadoUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhadoUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhadoUsuario == "papel" && escolhaApp == "pedra")
      ) { setState(() {
        this._mensagem = "Parabens você e o vencedor";
      });

      } else if (
          (escolhaApp == "pedra" && escolhadoUsuario == "tesoura")||
          (escolhaApp == "tesoura" && escolhadoUsuario == "papel")||
          (escolhaApp == "papel" && escolhadoUsuario == "pedra")
      ) { setState(() {
        this._mensagem =" Você perdeu KKKKKKK";

      });

      } else {

        setState(() {
          this._mensagem =" O Jogo empatou";
        });

      }



    }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         title: Text("JokenPo"),
       ) ,
       body: Column(
         crossAxisAlignment:CrossAxisAlignment.center,
         children: [
           Padding(
             padding: EdgeInsets.only(top: 32, bottom: 10 ),
             child: Text("Escolha do APP",
             textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold,
             )),
           ),
           Image(image: this._imagenApp,),
           Padding(
             padding: EdgeInsets.only(top: 32, bottom: 10 ),
             child: Text(this._mensagem,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 )),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [


               GestureDetector(onTap:() => opcaoSelecionada("papel"),
                   child: Image.asset("imagem/papel.png",height: 95,)),
               GestureDetector(onTap: () => opcaoSelecionada("tesoura"),
                   child: Image.asset("imagem/tesoura.png",height: 95,)),
               GestureDetector(onTap: () => opcaoSelecionada("pedra"),
                   child: Image.asset("imagem/pedra.png",height: 95,)),

             ],),





         ],
       ) ,
     );
   }
 }
 