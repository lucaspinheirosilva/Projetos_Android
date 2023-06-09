import os

#FUNÇOES
def Soma (n1,n2):
    return print(f'Soma:{n1+n2}')

def Subtracao(n1,n2):
     return print(f'Subtração :{n1-n2}')

def Multiplicacao(n1,n2):
     return print(f'Multiplicação :{ n1*n2}')

def Divisao (n1,n2):
    if n1 == 0:
        print('Não existe divisão por 0 (zero)')
        return None
    else:
         return print(f'Divisão :{n1/n2}')

def Todos(n1,n2):
    Soma(num1,num2)
    Subtracao(num1,num2)
    Divisao(num1,num2)
    Multiplicacao(num1,num2)

def Porcentagem():
    opc = input("1 - Desconto \n2 - Acrescimo ")
    if opc == "1":
        n1= float(input('Digite o Valor do Produto: '))
        n2= float(input('Digite o Percentual de Desconto: '))
        porc = ((n1*n2)/100)
        porc = n1 - porc
        return print(f'Valor final com Desconto :{porc}')

    if opc =="2":   
        n1= float(input('Digite o Valor do Produto: '))
        n2= float(input('Digite o Percentual de Acrescimo: ')) 
        porc = ((n1*n2)/100)
        porc = n1 + porc
        return print(f'Valor final com Acrescimo :{porc}')
    

#INPUTS
while True:
    operacao = input('-----ESCOLHA------\n1 - Soma \n2 - Subtraçaõ \n3 - Divisão \n4 - Multiplicação \n5 - Todos \n\n6 - Porcentagem \n ')

    if operacao == '1':
        num1 = float(input('Digite o Primeiro Valor: '))
        num2 = float(input('Digite o segundo Valor: '))
        Soma(num1,num2)
    if operacao == '2':
        num1 = float(input('Digite o Primeiro Valor: '))
        num2 = float(input('Digite o segundo Valor: '))
        Subtracao(num1,num2)
    if operacao == '3':
        num1 = float(input('Digite o Primeiro Valor: '))
        num2 = float(input('Digite o segundo Valor: '))
        Divisao(num1,num2)
    if operacao == '4':
        num1 = float(input('Digite o Primeiro Valor: '))
        num2 = float(input('Digite o segundo Valor: '))
        Multiplicacao(num1,num2)
    if operacao == '5':
        num1 = float(input('Digite o Primeiro Valor: '))
        num2 = float(input('Digite o segundo Valor: '))
        Todos(num1,num2)
    if operacao == '6':
        os.system('cls' if os.name == 'nt' else 'clear')
        Porcentagem()   



