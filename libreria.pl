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


%libromascaro/1 se cumple para un articulo si es el libro de mayor precio

libromascaro(libro(Titulo,Autor,Genero,Editorial)):-
    forall(vende(libro(_,_,_,_),Precio1),vende(libro(_,_,_,_),Precio1)<Precio).

%curiosidad/1 se cumple para un articulo si es lo unico que hay a la venta de su autor.

curiosidad(Articulo):-autor(Articulo,Autor),vende(Otro,_),autor(Otro,Autor), Articulo=Otro.

%sePrestaAConfusion/1 se cumple para un titulo si pertenece a mas de un articulo.

titulo(libro(Titulo,_,_,_),Titulo):-vende(libro(Titulo,_,_,_),_).
titulo(cd(Titulo,_,_,_,_),Titulo):-vende(cd(Titulo,_,_,_,_),_).


sePrestaAConfucion(Titulo):-
titulo(UnArticulo,Titulo),
titulo(OtroArticulo,Titulo),
UnArticulo \= OtroArticulo.

%mixto/1 se cumple para los autores de mas de un tipo de articulo.

mixto(Autor):-
    vende(libro(_,Autor,_,_),_),
    vende(cd(_,Autor,_,_,_),_).

%5 agregar soporte para vender Peliculas con titulo, director y genero.
titulo(pelicula(Titulo,_,_),Titulo):-vende(pelicula(Titulo,_,_),_).