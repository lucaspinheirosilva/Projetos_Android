import os
import sys
import menu_Geral.menu_repeticao as menu_repeticao

dir_path_absolute = os.getcwd()
sys.path.append(dir_path_absolute+'\\funcoes\\')

import classes.lacos_repeticoes.For as For


def  MenuExerciciosRepeticao(): 
  print('---------------LAÇOS FOR -------------')
  print('1 - escrever de 0 ate 100 no console')
  print('2 - receba um número, calcule e mostre a tabuada desse número')
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
      For.print_100_Nunber()
      return MenuExerciciosRepeticao()
    case 2:
      limparConsole()
      numero =int(input("Digite qual numero voce quer a Tabuada: "))
      For.tabuada(numero)
      return MenuExerciciosRepeticao() 
    case 99:
      limparConsole()
      return menu_repeticao.MenuLacosRepeticao()
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuExerciciosRepeticao()       
 