import 'package:flutter/material.dart';

import '../models/refeicao.dart';

import '../utils/app-routes.dart';

class RefeicaoItem extends StatelessWidget {

  final Refeicao refeicao;

  const RefeicaoItem(this.refeicao);

  void _selectRefeicao(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.REFEICAO_DETAIL,
      arguments: refeicao
    ).then((result) {
      if(result == null){
        print('Sem Resultado');
      }else{
        print('O Nome da refeição é $result.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectRefeicao(context),
      child: Card(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin:  const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15)
                  ),
                  child: Image.network(
                    refeicao.imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      refeicao.titulo,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text('${refeicao.duracao} min'),
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text(refeicao.complexityText),
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text(refeicao.costText),
                  ],)
                ],
              ),
            ),
            
          ],
        ),
              
      ),
    );
  }
}