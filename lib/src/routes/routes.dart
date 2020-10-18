import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';
import '../pages/card_page.dart';
import 'package:componentes1/src/pages/animated_container.dart';
import 'package:componentes1/src/pages/input_page.dart';
import 'package:componentes1/src/pages/slider_page.dart';
import 'package:componentes1/src/pages/listview_page.dart';


Map<String,WidgetBuilder>getApplicationRoutes(){
  return <String,WidgetBuilder>{
        '/':(BuildContext context)=>HomePage(),
        'alert':(BuildContext context)=>AlertPage(),
        'avatar':(BuildContext context)=>AvatarPage(),
        'card':(BuildContext context)=>CardPage(),
        'animatedContainer':(BuildContext context)=>AnimatedContainerPage(),
        'inputs':(BuildContext context)=>InputPage(),
        'slider':(BuildContext coontext)=>SliderPage(),
        'listView':(BuildContext context)=>ListaPage(),
      };
}