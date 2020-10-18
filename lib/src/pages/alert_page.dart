import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:RaisedButton(
          child:Text('Mostrando alerta'),
          //EL color no se ve refejadohaste que se ponga el método onPressed
          color: Colors.blue,
          textColor: Colors.white,
          shape:StadiumBorder(),
          onPressed: (){
            _mostrarAlert(context);
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
                  Icons.add_to_home_screen,
                  color: Colors.red,
                ),
        onPressed: ()=>Navigator.pop(context),
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      //Esto evita que te salgas del alert
      barrierDismissible: true,
      builder:(context){
        return AlertDialog(
          //RoundedRectagularBorder nos permite acceder al BorderRadius, a diferencia de Stadium Border
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text('Titulo'),
          content: Column(
            //El espacio se va acoplando según la cantidad de palabras que see requieran
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este  es el contenido de la alerta\nY esto se va haciendo más extenso hacía abajo'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child:Text('Cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );

  }
}