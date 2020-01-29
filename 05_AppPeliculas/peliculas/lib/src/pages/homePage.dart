import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        //Especifica el tipo de vista de los items
        layout: SwiperLayout.STACK,
        itemWidth: 200,
        itemCount: 3,
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
      ),
    );
  }
}