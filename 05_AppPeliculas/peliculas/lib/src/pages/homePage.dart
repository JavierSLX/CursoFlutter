import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculasProvider.dart';
import 'package:peliculas/src/widgets/MovieHorizontal.dart';
import 'package:peliculas/src/widgets/cardSwiperWidget.dart';

class HomePage extends StatelessWidget {

  final peliculaProvider = PeliculaProvider();

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
          //Deja espacio entre los dos elementos
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )
    );
  }

  //Crea el widget de cambio de tarjetas
  Widget _swiperTarjetas() {
    // peliculaProvider.getEnCines();
    // return CardSwiper(peliculas: [1, 2, 3, 4, 5],);

    //Regresa un FutureBuilder
    return FutureBuilder(
      future: peliculaProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        //Si hay información la muestra, si no muestra un progress
        if(snapshot.hasData)
        {
          //Regresa la lista de peliculas
          return CardSwiper(peliculas: snapshot.data);
        }
        else
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
      },
    );
  }

  //Regresa las peliculas populares
  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        //Coloca los elementos cargados a la izquierda
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text("Populares", style: Theme.of(context).textTheme.subhead,)
          ),
          SizedBox(height: 5,),
          FutureBuilder(
            future: peliculaProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if(snapshot.hasData)
                return MovieHorizontal(peliculas: snapshot.data,);
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}