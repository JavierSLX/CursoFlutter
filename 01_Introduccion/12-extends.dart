void main()
{
  final Heroe superman = new Heroe();
  superman.nombre = "Clark Kent";
  
  final Villano luthor = new Villano();
  luthor.nombre = "Lex Luthor";
}

abstract class Personaje
{
  String poder;
  String nombre;
}

class Heroe extends Personaje
{
  int valentia;
}

class Villano extends Personaje
{
  int maldad;
}