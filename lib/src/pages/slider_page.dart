import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label:'Tamaño de la imagen',
      divisions: 20,
      value:_valorSlider,
      min: 10.0,
      max:400.0,
      //Condición ternaria
      onChanged:(_bloquearCheck)?null: (valor){
        setState(() {
          _valorSlider = valor;
        });
        
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://www.dzoom.org.es/wp-content/uploads/2017/07/seebensee-2384369-810x540.jpg'),
      width: _valorSlider,
      fit:BoxFit.contain,
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value:_bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquearCheck=valor;
    //     });
        
    //   },
    // );
    //La diferencia  es que este los pone en forma de lista y permite poner un titulo
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value:_bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck=valor;
        });
        
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Switch'),
      value:_bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );  
  }
}