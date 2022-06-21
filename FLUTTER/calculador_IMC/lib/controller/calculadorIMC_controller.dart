/*
Valor de IMC                         	Classificação
Menor que 18,5 kg/m2                  	Magreza
18,5 a 24,9 kg/m2                     	Normal
25 a 29,9 kg/m2                       	Sobrepeso
30 a 34,9 kg/m2                       	Obesidade grau I
35 a 39,9 kg/m2                        	Obesidade grau II
Maior que 40 kg/m2                    	Obesidade grau III
 */

class CalcIMC_controller {
  onTapResetarCampos(double altura, double peso, String resultado) {
    altura = 0;
    peso = 0;
    resultado = "Informe seus dados!";
  }
}
