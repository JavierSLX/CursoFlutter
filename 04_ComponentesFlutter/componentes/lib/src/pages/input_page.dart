import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  List<String> _poderes = ["Volar", "Rayos X", "Super Aliento", "Super Fuerza"];
  //Permite manipular las caracteristicas de un widget (En este caso una caja de texto)
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    //Regresa una caja de texto individual
    return TextField(
      //Se pone el foco al iniciar
      autofocus: true,
      //Capitalizacion de las palabras
      textCapitalization: TextCapitalization.words,
      //Coloca un borde, una leyenda, una sugerencia, una etiqueta, texto de ayuda, un icono al inicio y al final
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_nombre == null ? 0 : _nombre.length}"),
        hintText: "Coloque su nombre",
        labelText: "Nombre",
        helperText: "Sólo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      //Cuando cambia el texto que contiene
      onChanged: (texto){

        //Redibuja cada vez que se cambia
        setState((){ 
          _nombre = texto;
        });

        //Muestra el nombre en consola
        print(_nombre);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    //Regresa una caja de texto individual
    return TextField(
      //El tipo de texto que se colocara (Tipo email)
      keyboardType: TextInputType.emailAddress,
      //Coloca un borde, una leyenda, una sugerencia, una etiqueta, texto de ayuda, un icono al inicio y al final
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Email",
        labelText: "Email",
        helperText: "Coloque su email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      //Cuando cambia el texto que contiene
      onChanged: (texto){

        //Redibuja cada vez que se cambia
        setState(() => _email = texto);

        //Muestra el nombre en consola
        print(_email);
      },
    );
  }

  Widget _crearPassword() {
    //Regresa una caja de texto individual
    return TextField(
      //Oculta el texto mientras se escribe
      obscureText: true,
      //Coloca un borde, una leyenda, una sugerencia, una etiqueta, texto de ayuda, un icono al inicio y al final
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Password",
        labelText: "Password",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      //Cuando cambia el texto que contiene
      onChanged: (texto){

        //Redibuja cada vez que se cambia
        setState(() => _email = texto);

        //Muestra el nombre en consola
        print(_email);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    //Regresa una caja de texto individual
    return TextField(
      enableInteractiveSelection: false,
      //Controlador que permite manipularlo
      controller: _inputFieldDateController,
      //Coloca un borde, una leyenda, una sugerencia, una etiqueta, texto de ayuda, un icono al inicio y al final
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      //Cuando se presiona la caja de texto
      onTap: (){
        //Quita el foco del elemento
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate(context);
      },
    );
  }

  //Crea el dialogo para elegir la fecha
  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2025),
      locale: Locale("es", "ES")
    );

    //Si se seleccionó una fecha
    if(picked != null)
    {
      setState((){
        _fecha = picked.toString();

        //Asigna el valor a la caja de texto
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  //Crea un combobox
  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        //Expande el widget con todo el espacio que tiene
        Expanded(
          child: DropdownButton(
            //Valor que muestra inicialmente
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            //Cuando se elige una opcion
            onChanged: (opt){
              //Redibuja el control para mostrar la opcion seleccionada
              setState(() => _opcionSeleccionada = opt);
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();

    //Cada elemento de la lista
    _poderes.forEach((poder){

      //Agrega cada elemento de la lista
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }
}