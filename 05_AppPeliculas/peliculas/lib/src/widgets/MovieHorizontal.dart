import 'package:flutter/material.dart';
import 'package:peliculas/src/models/Pelicula.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  //Constructor que requiere la lista de peliculas
  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.30,
      //Crea un pageview (de manera horizontal)
      child: PageView(
        //Quita el efecto "magnetico" del page
        pageSnapping: false,
        //Inicia con la pagina 1 y muestra 3 imagenes a lo ancho
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _tajetas(context)
      ),
    );
  }

  List<Widget> _tajetas(BuildContext context) {

    //Obtiene un elemento de manera individual
    return peliculas.map((pelicula){
      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage("assets/photo.jpg"),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 5,),
            //El overflow coloca 3 puntos cuando el texto rebasa el espacio
            Text(pelicula.title, 
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}