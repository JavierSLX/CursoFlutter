
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:peliculas/src/models/Pelicula.dart';

class PeliculaProvider
{
  String _apikey = "500984ed868632eb7483b332482c1ded";
  String _url = "api.themoviedb.org";
  String _language = "es-ES"; 

  Future<List<Pelicula>> _procesarRespuesta(Uri uri) async
  {
    //Realiza la peticion api
    final respuesta = await http.get(uri);

    //Obtiene el mapa del string del json
    final decodeData = json.decode(respuesta.body);

    //Convierte el mapa a la lista de peliculas
    final peliculas = new Peliculas.fromJsonList(decodeData["results"]);

    //Regresa la lista de peliculas
    return peliculas.items;
  }

  //Regresa la lista de peliculas que están en el cine
  Future<List<Pelicula>> getEnCines() async
  {
    //Construye la url de peticion
    final url = Uri.https(_url, "3/movie/now_playing", {
      'api_key': _apikey,
      'language': _language
    });

    return await _procesarRespuesta(url);
  }

  //Regresa la lista de peliculas populares
  Future<List<Pelicula>> getPopulares() async
  {
    //Construye la url de la peticion
    final url = Uri.https(_url, "3/movie/popular", {
      'api_key': _apikey,
      'language': _language
    });

    return _procesarRespuesta(url);
  }
}