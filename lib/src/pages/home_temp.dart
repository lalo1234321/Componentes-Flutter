import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  final opciones=['uno','dos','tres','cuatro','cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'), 
      ),
      body: ListView(
        // children:_crearItems()
          children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista=new List<Widget>();
    for (String opt in opciones) {
      final widgetTemp=ListTile(
        title: Text(opt),
      );
      lista.add(widgetTemp);
      lista.add(Divider(color: Colors.blue,height: 100.0,thickness: 40.0,));
    }
    return lista;
  }

  List<Widget> _crearItemsCorta(){
    var widgets=opciones.map((item){
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.adb),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap:(){}
          ),
          Divider(color: Colors.red,height: 80.0,thickness: 25.0,)
        ],
      );
    }).toList();
    return widgets;
  }
}