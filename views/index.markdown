# NIF GENERATOR

Esto es un simple generador de NIF aleatorios.

Ejemplos de uso:

    # NIF aleatorio
    /random
    # => 12345678Z
    
    # Letra del NIF
    /12345678
    # => Z
    
    # Letra del NIF, en este caso el número es erróneo
    /1234567
    # => false
    
    # Verificar que un NIF es valido
    /12345678Z
    # => true
    
    # Verificar que un NIF es valido, en este casi es erroneo
    #/12345678Z
    # => false
    
    
    
Puedes ver el código en [GitHub](https://github.com/ceritium/NIF-Generator).