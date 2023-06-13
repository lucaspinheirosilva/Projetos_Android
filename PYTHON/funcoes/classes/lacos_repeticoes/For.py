import sys
import os
dir_path_absolute = os.getcwd()

sys.path.append(dir_path_absolute+'/funcoes/menu_Geral')
import menu_Geral as menu

def print_100_Nunber():   
    print("Escrevendo de 0 até 100")
    for i in range(101):
        print(i)

def tabuada(numero:int):
    if numero <= 0:
        print('Numero tem que ser maior que 0 (ZERO)')
    else:
        for i in range(1,11):
            tabuado:int =  numero*i
            valFormat =f'{tabuado:_.2f}'.replace('.',',').replace('_','.')
            print(f'{numero} x {i} = {valFormat}')