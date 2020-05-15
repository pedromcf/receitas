import 'package:flutter/material.dart';
import '../models/refeicao.dart';

class RefeicaoDetalheTelas extends StatelessWidget {

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child){
    return Container(
      width: 330,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final refeicao = ModalRoute.of(context).settings.arguments as Refeicao;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(refeicao.titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                refeicao.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(            
              ListView.builder(
                itemCount: refeicao.ingredientes.length,
                itemBuilder: (ctx, index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal:10,
                      ),
                      child: Text(refeicao.ingredientes[index]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _createSectionTitle(context,'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: refeicao.passos.length,
                itemBuilder: (ctx, index){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index+1}'),
                        ),
                        title: Text(refeicao.passos[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}