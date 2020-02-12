import "dart:convert";

void main()
{
  final String rawJson = '{"nombre": "Logan", "poder": "Mutante"}';
  
  //Obtenemos un mapa del json
  final Map parseJson = json.decode(rawJson);
  print(parseJson);
  
  //Instancia una clase con un constructor con nombre
  final Heroe wolwerine = new Heroe.fromJson(parseJson);
  print(wolwerine);
}

//Clase Heroe
class Heroe
{
  String nombre;
  String poder;
  
  //Constructor que asigna las propiedades automaticamente
  Heroe(this.nombre, this.poder);
  
  //Constructor con nombre
  Heroe.fromJson(Map parseJson)
  {
    nombre = parseJson["nombre"];
    poder = parseJson["poder"];
  }
  
  String toString() => "${this.nombre} - ${this.poder}";
}
