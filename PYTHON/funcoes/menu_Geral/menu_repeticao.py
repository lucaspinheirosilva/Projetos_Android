import menu_Geral as principal

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

def MenuRepeticaoSelecionado( opc:int):
  match(opc):
    case 1:
      return print('aqui vai chamar o menu for com os exercicios')
    case 2:
      return print('aqui vai chamar o menu forEach com os exercicios')
    case 3:
      return print('aqui vai chamar o menu while com os exercicios') 
    case 4:
      return print('aqui vai chamar o menu DoWhile com os exercicios')
    case 99:
      return principal.MenuPrincipal()  
    case default:
     print('OPÇÃO INVÁLIDA.')
     return MenuLacosRepeticao()   