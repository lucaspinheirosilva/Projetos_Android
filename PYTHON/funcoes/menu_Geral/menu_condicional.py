import menu_Geral.menu as principal


def  MenuLacosCondicionais(): 
  print('---------------LAÇOS CONDICIONAIS -------------')
  print('1 - if/else')
  print('2 - swich/case')
  print('99 - Voltar Menu Principal')
  try:
   escolha= (int(input('Escolha: ')))
   MenuCondicionalSelecionado(escolha)
  except ValueError as erros:
    print('CARACTER INVÁLIDO.')
    MenuLacosCondicionais()

def MenuCondicionalSelecionado( opc:int):
  match(opc):
    case 1:
      return print('aqui vai chamar o menu if/else com os exercicios')
    case 2:
      return print('aqui vai chamar o menu swith/case com os exercicios')
    case 99:
      return principal.menu_Geral()
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuLacosCondicionais()       
 




