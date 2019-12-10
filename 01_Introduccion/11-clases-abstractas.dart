void main()
{
  final Perro perro = new Perro();
  perro.emitirSonido();
}

//Clase abstracta (No puede ser instanciada)
abstract class Animal
{
  int patas;
  
  void emitirSonido();
}

//Perro hereda de Animal
class Perro extends Animal
{
  int patas;
  int colas;
  
  void emitirSonido() => print ("GUAUUUUU!");
}