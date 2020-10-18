import 'package:flutter/material.dart';
import '../providers/menu_provider.dart';
import '../util/icono_string_util.dart';
import './alert_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componenetes'),
        backgroundColor: Colors.deepPurple,
      ),
      body:_lista(),
    );
  }
  Widget _lista(){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder:(BuildContext context,AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
        children: _listaItems(snapshot.data,context),
        );
      }
    );
  // print(menuProvider.opciones);  
  // menuProvider.cargarData().then((opciones){
  //   print('_lista');
  //   print(opciones);
  // });
  
  }
  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
    final List<Widget> opciones=[];
    data.forEach((opt){
      final widgetTemp=ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios,color: Colors.blue[300],),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);

          //Forma obsoleta tipo java swing
          // final route=MaterialPageRoute(
          //   builder: (context){
          //     return AlertPage();
          //   }
          // );
          // Navigator.push(context, route);
        },
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });
    return opciones;
  }
}
    
  
  