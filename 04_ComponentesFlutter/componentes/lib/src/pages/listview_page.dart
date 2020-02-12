import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //Propiedad para manipular el scroll
  ScrollController _scrollController = new ScrollController();

  //En el ciclo de vida cuando inicia el state
  @override
  void initState() {
    super.initState();
    _agregar10();

    //Evento cada que se mueva el scroll se dispara
    _scrollController.addListener((){
      print("Scroll");

      //Cuando el scroll llega a su maximo carga 10 imagenes más
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
      {
        //_agregar10();
        //Trae la informacion a cargar
        _fetchData();
      }
    });
  }

  //Ciclo de vida cuando la pagina deja de existir en el stack
  @override
  void dispose() {
    super.dispose();

    //Elimina el controlador para optimizar memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: 
      //Agrega un stack (apila widget)
      Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  //Crea una lista builder (Esta se usa cuando se desconoce los elementos que tendra o si son muchos de ellos)
  Widget _crearLista()
  {

    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        //Enlaza el controlador para poder controlarlo
        controller: _scrollController,
        //Cuantos elementos tiene la lista
        itemCount: _listaNumeros != null ? _listaNumeros.length : 0,
        //Se le pasa un metodo con contexto y el indice que dibujara
        itemBuilder: (BuildContext context, int index){
          //Obtiene el valor de la lista de numeros
          final imagen = _listaNumeros[index];

          //Regresa una imagen sacada de internet
          return FadeInImage(
            //Imagen de carga
            placeholder: AssetImage("assets/jar-loading.gif"),
            //Imagen aleatoria
            image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    //Fija la duracion en 2 segundos
    final duration = Duration(seconds: 2);
    new Timer(duration, (){
      //Limpia la lista de numeros
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  //Agrega 10 elementos más a la lista
  void _agregar10()
  {
    for(int i = 1; i < 10; i++)
    {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    //Se redibuja la pantalla
    setState(() {
    });
  }

  //Regresa un futuro
  Future<Null> _fetchData() async {
    _isLoading = true;

    //Se da la indicación a flutter de redibujar porque una propiedad cambio
    setState(() {
    });

    //Simula un delay
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  //Simula la respuesta de obtener 10 elementos
  void respuestaHTTP() {
    _isLoading = false;

    //Mueve un poco mas el scroll
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading() {

    //Si esta cargando regresa un progress y si no un contenedor vacio
    if(_isLoading)
      return Column(
        //Agrega el elemento al final de la columna
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            //Centra en columna
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(backgroundColor: Colors.white,)
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
    else
      return Container();
  }
}