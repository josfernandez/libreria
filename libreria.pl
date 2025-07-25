% Predicados
%vende(Titulo,Autor,Genero,Editorial,Precio)
%vende(Articulo,Precio)
vende(libro(elResplandor, stephenKing, terror,debolsillo),          2300).
vende(libro(cronicasdeangeles, alejandroDolina, ficcion,booket),    1600).
vende(libro(harryPotter, jkRowling, ficcion, salamandra),           2500).
vende(cd(elamordespuesdelamor, fito, rock, 10 , 15),                 450).
vende(cd(pubisangelical, charly, rock, 10, 15),                      500).

%tematico(Autor): se cumple para un autor si todo lo que se vende es de el

tematico(Autor):- 
    autor(_,Autor),
    forall(vende(Articulo,_), autor(Articulo, Autor)).

autor(libro(_,Autor,_,_), Autor):-vende(libro(_,Autor,_,_),_).
autor(cd(_,Autor,_,_,_), Autor):-vende(cd(_,Autor,_,_,_),_).


