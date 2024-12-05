def sistema():
    print("Bem-vindo ao Sistema !")
    
    # 
    senha = input("Por favor, defina sua senha: ")
    print("Senha definida com sucesso!")
    
    
    tentativas_restantes = 3  
    while tentativas_restantes > 0:
        tentativa = input("\nDigite sua senha para acessar o sistema: ")
        if tentativa == senha:
            print("Acesso concedido! Bem-vindo!")
            break
        else:
            tentativas_restantes -= 1
            print(f"Senha incorreta. Você ainda tem {tentativas_restantes} tentativa(s).")
            
    
    if tentativas_restantes == 0:
        print("Você excedeu o número de tentativas. O acesso foi bloqueado.")
sistema()
