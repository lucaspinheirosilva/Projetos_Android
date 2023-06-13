import menu_Geral.menu as principal
import menu_Geral.pkg_menu_repeticao.menu_for as menu_for
import os

def  MenuLacosRepeticao():
  print('---------------LAÇOS DE REPETICAO-------------')
  print('1 - for')
  print('2 - forEach')
  print('3 - while')
  print('4 - DoWhile')
  print('99 - Voltar Menu Principal')
  try:
   escolha= (int(input('Escolha: ')))
   MenuRepeticaoSelecionado(escolha)
  except ValueError as erros:
    print('CARACTER INVÁLIDO.')
    MenuLacosRepeticao()    

def limparConsole():
  os.system('cls' if os.name == 'nt' else 'clear')

def MenuRepeticaoSelecionado( opc:int):
  match(opc):
    case 1:
      limparConsole()
      return menu_for.MenuExerciciosRepeticao()
    case 2:
      limparConsole()
      return print('aqui vai chamar o menu forEach com os exercicios')
    case 3:
      limparConsole()
      return print('aqui vai chamar o menu while com os exercicios') 
    case 4:
      limparConsole()
      return print('aqui vai chamar o menu DoWhile com os exercicios')
    case 99:
      limparConsole()
      return principal.MenuPrincipal()  
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuLacosRepeticao()   