import 'package:flutter/material.dart';

import 'src/pages/home_temp.dart';
import 'src/routes/routes.dart';
import 'src/pages/alert_page.dart';

void main() => runApp(MyApp());
 //stless snippet para generar un esquema del stateless widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      //usar cuando no se tenga listo el diseño de una ruta con un condicional settings.name
      onGenerateRoute: (RouteSettings settings){
        print('ruta llamada ${settings.name}');
        return MaterialPageRoute(
          builder:(BuildContext context)=>AlertPage());
      },
    );
  }
}