import sys
sys.path.append('\classes\lacos_repeticao')

import For


def  Menu():
  print('---------------MENU-------------')
  print('1 - Laços de Repetição')
  print('2 - Estrutura Condicional')
  escolha= (int(input('Escolha: ')))
  MenuSelecionado(escolha)


def MenuSelecionado( opc:int):
  match(opc):
    case 1:
      return For.print_100_Nunber()
    case 2:
      return None  