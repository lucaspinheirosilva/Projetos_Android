import menu_Geral.menu_repeticao as menu_repeticao
import sys
import os

dir_path_absolute = os.getcwd()
sys.path.append(dir_path_absolute+'\funcoes\classes\lacos_repeticao')
import For as FOR




def  MenuExerciciosRepeticao(): 
  print('---------------LAÇOS FOR -------------')
  print('1 - escrever de 0 ate 100 no console')
  print('2 - receba um número, calcule e mostre a tabuada desse número')
  print('3 - receba o valor de um carro e mostre uma tabela com os seguintes dados: preço final, quantidade de parcelas'+
  'e valor da parcela. Considere o seguinte:\n'+
  '       -> O preço final para compra à vista tem um desconto de 20%;\n'+
  '       -> A quantidades de parcelas pode ser: 6, 12, 18, 24, 30, 36, 42, 48, 54 e 60.\n'+
  '       -> Os percentuais de acréscimo aumentam 3%') 
  print('99 - VOLTAR')
  try:
   escolha= (int(input('Escolha: ')))
   MenuCondicionalSelecionado(escolha)
  except ValueError as erros:
    print('CARACTER INVÁLIDO.')
    MenuExerciciosRepeticao()

def limparConsole():
  os.system('cls' if os.name == 'nt' else 'clear')

def MenuCondicionalSelecionado( opc:int):
  match(opc):
    case 1:
      print_100_Nunber()
      return MenuExerciciosRepeticao()
    case 2:
      print('calcula a tabuada')
      return MenuExerciciosRepeticao() 
    case 99:
      limparConsole()
      return menu_repeticao.MenuLacosRepeticao()
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuExerciciosRepeticao()       
 