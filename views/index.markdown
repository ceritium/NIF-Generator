# NIF GENERATOR

Esto es un simple generador de NIF aleatorios.

Ejemplos de uso:

    # NIF aleatorio
    /random
    # => 32063227P
    
    # Letra del NIF
    /32063227
    # => P
    
    # Letra del NIF, en este caso el número es erróneo
    /3206322
    # => false
    
    # Verificar que un NIF es valido
    /32063227P
    # => true
    
    # Verificar que un NIF es valido, en este casi es erroneo
    #/32063227Z
    # => false
    
    
    
    