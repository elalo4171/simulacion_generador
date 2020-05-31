import 'package:flutter/material.dart';

class GeneradorAleatorios with ChangeNotifier {
// ----------------------------------------------------------------------------------------------------------
  int _metodoSeleccionado = 0;

  set metodoSeleccionado(int numero) {
    _metodoSeleccionado = numero;
    notifyListeners();
  }

  int get metodoSeleccionado => _metodoSeleccionado;

// ----------------------------------------------------------------------------------------------------------

  List<double> _aleatoriosAdictivo = [];

  get numerosAleatoriosAdictivo => _aleatoriosAdictivo;

  set numerosAleatoriosAdictivo(List numeros) {
    _aleatoriosAdictivo = numeros;
    notifyListeners();
  }

// ----------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------

  List<double> _aleatoriosMultiplicativo = [];

  get numerosAleatoriosMultiplicativo => _aleatoriosMultiplicativo;

  set numerosAleatoriosMultiplicativo(List<double> numeros) {
    _aleatoriosMultiplicativo = numeros;
    notifyListeners();
  }

// ----------------------------------------------------------------------------------------------------------
//Metodo para generar numero pseudoaleatorios por el metodo adictivo

  generarAdictivo(List<double> semillas, int modulo, int numeroSemillas) {
    if (semillas.length <= 2) {
      print(semillas.length);
      print("Problemas con las semillas");
      return -1;
    }
    if (modulo % 2 != 0) {
      print("Problema con el modulo");
      return -1;
    }
    List<double> semillasTemporales = [];
    semillasTemporales = semillas;
    for (var i = 0; i < numeroSemillas; i++) {
      double suma = semillasTemporales[i] +
          semillasTemporales[semillasTemporales.length - 1];
      double conModulo = suma % 100;
      semillasTemporales.add(conModulo);
    }
    return semillasTemporales;
  }

// ----------------------------------------------------------------------------------------------------------
//Metodo para la generacion de numeros por el metodo congruencial multiplicativo
 generadorMultiplicativo(double semilla,int multiplicador, int modulo, int numeroSemillas){
   if(multiplicador%3==0 || multiplicador%5==0 || multiplicador%2==0){
     print("Error con el multiplicador");
     return -1;
   }
   if(semilla<0){
     print("Error en semilla");
     return -1;
   }
   if (modulo % 2 != 0) {
      print("Problema con el modulo");
      return -1;
    }
   List<double> semillas=[];
   semillas.add(semilla);
   for (var i = 0; i < numeroSemillas; i++) {
     semillas.add((semillas[semillas.length-1]*multiplicador)%100);
   }
   return semillas;
 }

// ----------------------------------------------------------------------------------------------------------

//Metodo para saber el periodo de repeticion de numeros generados aleatorios

  int repeticion(List numeros) {
    int veces = 0;
    for (var i = 0; i < numeros.length; i++) {
      for (var j = 0; j < numeros.length; j++) {
        if (numeros[i] == numeros[j]) {
          veces++;
        }
      if (veces==2) 
      return j-i;
      }
    }
    return 0;
  }
}