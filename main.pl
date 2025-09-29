% Sistema experto para clasificación de flores
% Estructura similar al ejemplo de animales

% Motor de inferencia principal
diagnostico(Flor) :- flor(Flor).

% Reglas para clasificar flores
flor(rosa) :-
    tiene(espinas),
    color(rojo),
    olor(agradable).

flor(margarita) :-
    no_tiene(espinas),
    color(blanco),
    olor(suave).

flor(tulipan) :-
    no_tiene(espinas),
    color(varios),
    olor(leve).

flor(girasol) :-
    no_tiene(espinas),
    color(amarillo),
    olor(leve).

flor(orquidea) :-
    no_tiene(espinas),
    color(blanco),
    olor(fuerte).

% Mecanismo de preguntas y memoria dinámica
:- dynamic conocido/2.

pregunta(Pregunta) :-
    (conocido(Pregunta, Respuesta) -> true ;
    write(Pregunta), write('? (si/no): '),
    read(Respuesta), 
    assert(conocido(Pregunta, Respuesta)),
    Respuesta = si).

% Predicados para características
tiene(espinas) :- pregunta('Tiene espinas').
color(rojo) :- pregunta('Es de color rojo').
color(blanco) :- pregunta('Es de color blanco').
color(amarillo) :- pregunta('Es de color amarillo').
color(varios) :- pregunta('Tiene varios colores').
olor(agradable) :- pregunta('Tiene olor agradable').
olor(suave) :- pregunta('Tiene olor suave').
olor(leve) :- pregunta('Tiene olor leve').
olor(fuerte) :- pregunta('Tiene olor fuerte').

% Negación para características ausentes
no_tiene(espinas) :- \+ tiene(espinas).

% Limpiar base de conocimientos dinámicos
limpiar :-
    retractall(conocido(_,_)),
    write('Base de conocimientos limpiada.').

% Instrucciones de uso
inicio :-
    limpiar,
    write('Sistema experto para identificar flores.'), nl,
    write('Responda las siguientes preguntas con si/no.'), nl,
    diagnostico(Flor),
    write('La flor es: '), write(Flor), nl.

inicio :-
    write('No se pudo identificar la flor.').
