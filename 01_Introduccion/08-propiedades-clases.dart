void main()
{
  //Instancia de Heroe (Constante)
  final Heroe wolwerine = new Heroe(nombre: "Logan", poder: "Mutante");
  print(wolwerine);
  print(wolwerine.nombre);
}

//Clase Heroe
class Heroe
{
  String nombre;
  String poder;
  
  //Constructor que asigna las propiedades automaticamente
  Heroe({this.nombre, this.poder});
  
  String toString() => "${this.nombre} - ${this.poder}";
}