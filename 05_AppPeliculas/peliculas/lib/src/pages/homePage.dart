import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/cardSwiperWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cines"),
        backgroundColor: Colors.indigoAccent,
        //Coloca un icono de búsqueda
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      //SafeArea: Widget que coloca las cosas donde se puede desplegar las cosas
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas()
          ],
        ),
      )
    );
  }

  //Crea el widget de cambio de tarjetas
  Widget _swiperTarjetas() {
    return CardSwiper(peliculas: [1, 2, 3, 4, 5],);
  }
}