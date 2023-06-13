import sys
import os
dir_path_absolute = os.getcwd()

sys.path.append(dir_path_absolute+'/funcoes/menu_Geral')
import menu_Geral as menu

def print_100_Nunber():   
    print("Escrevendo de 0 até 100")
    for i in range(101):
        print(i)
       