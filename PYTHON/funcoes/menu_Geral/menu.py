import menu_Geral.menu_repeticao as menu_repeticao
import menu_Geral.menu_condicional as menu_condicional
import os

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

def limparConsole():
  os.system('cls' if os.name == 'nt' else 'clear')

def MenuPrincipalSelecionado( opc:int):
  match(opc):
    case 1:
      limparConsole()
      return menu_repeticao.MenuLacosRepeticao()
    case 2:
      limparConsole()
      return menu_condicional.MenuLacosCondicionais()
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuPrincipal()     
