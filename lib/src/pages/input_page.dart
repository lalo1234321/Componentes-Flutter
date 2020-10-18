import 'package:flutter/material.dart';


class InputPage  extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  TextEditingController _inputFieldDateController = new TextEditingController(); 
  List<String> _poderes = ['Volar', 'Rayos x', 'Super aliento', 'Super fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input'),
        backgroundColor: Colors.red,
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
                  ],
                          )
                        );
              }
                    
    Widget _crearInput() {
      return TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counter: Text('Letras ${_nombre.length}'), 
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(
            Icons.accessibility,
            color: Colors.red,
          ),
          icon: Icon(Icons.account_circle),
        ),
        onChanged: (valor){
          
          setState(() {
            _nombre=valor;
          });
        },
      );
    }
      
    Widget _crearPersona() {
      return ListTile(
        title: Text('Mi nombre es ${_nombre}'),
        subtitle: Text('Email: ${_email}\nPassword: ${_password}'),
        trailing: Text(_opcionSeleccionada),
        
      );
      
    }

    Widget _crearEmail() {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), 
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(
              Icons.alternate_email,
              color: Colors.red,
            ),
            icon: Icon(Icons.email),
          ),
          onChanged: (valor){
            setState(() {
              _email=valor;
            });
          },
        );
    }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), 
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.enhanced_encryption,
          color: Colors.red,
        ),
        icon: Icon(Icons.grain),
      ),
      onChanged: (valor){
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), 
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Colors.red,
        ),
        icon: Icon(Icons.call_to_action),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus( new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2050),
    );
    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
      

    }
  }
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((element) {
      lista.add( DropdownMenuItem(
          child: Text(element),
          value: element,
      ));  
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width:30.0),
        DropdownButton(
        value: _opcionSeleccionada,
        items:getOpcionesDropdown(),
        onChanged: (opt) {
          setState(() {
            _opcionSeleccionada=opt;
          });
        },
      )
  
      ],
    );
    
    
    
}
}