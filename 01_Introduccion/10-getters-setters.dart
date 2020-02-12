void main()
{
  final Cuadrado cuadrado = new Cuadrado();
  
  cuadrado.lado = 10;
  print(cuadrado);
  print(cuadrado.area);
}

class Cuadrado
{
  //Propiedades privadas con guion bajo
  double _lado;
  double _area;
  
  //Setters
  set lado(double valor)
  {
    //Dispara error
    if(valor <= 0)
      throw("El lado no puede ser menor o igual a 0");
    
    _lado = valor;
  }
  
  //Getters
  double get area =>  _lado * _lado;
  
  String toString() => "$_lado - $_area";
}