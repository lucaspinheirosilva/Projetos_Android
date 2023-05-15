

def soma (*args):
    import os
    os.system('cls' if os.name == 'nt' else 'clear')
    par = 0
    impar = 0 

    if len(args) >0:
     for numero in args:
       if (numero%2)==0:
         par+=numero
       else:
         impar+=numero   
     print(f"a soma de numeros Pares é:{par}")
     print(f"a soma de numeros Impares é:{impar}")     
    else:
     print("Nenhum valor informado")        
    
             




soma()
