import sys
from classes.lacos_repeticoes.For import print_100_Nunber 

def  Menu():
  print('---------------MENU-------------')
  print('1 - Laços de Repetição')
  print('2 - Estrutura Condicional')
  escolha= (int(input('Escolha: ')))
  MenuSelecionado(escolha)


def MenuSelecionado( opc:int):
  match(opc):
    case 1:
      return print_100_Nunber()
    case 2:
      return None 

Menu()       