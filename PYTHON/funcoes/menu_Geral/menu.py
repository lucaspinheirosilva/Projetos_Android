import menu_repeticao
import menu_condicional
import os

import menu_Geral

def  MenuPrincipal():
  os.system('cls' if os.name == 'nt' else 'clear')
  print('---------------MENU-------------')
  print('1 - Laços de Repetição')
  print('2 - Estrutura Condicional')
  try:
   escolha= (int(input('Escolha: ')))
   MenuPrincipalSelecionado(escolha)
  except ValueError as erros:
    print('CARACTER INVÁLIDO.')
    MenuPrincipal()

def MenuPrincipalSelecionado( opc:int):
  match(opc):
    case 1:
      return menu_repeticao.MenuLacosRepeticao()
    case 2:
      return menu_condicional.MenuLacosCondicionais
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuPrincipal()     
