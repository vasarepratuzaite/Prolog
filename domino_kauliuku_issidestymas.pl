
%uzklausu pavyzdziai: 
%solve([(6, 3), (6, 6), (3, 6)]).
%solve([(1, 2), (2, 3), (3, 2)]).
%domino_chain([(1, 2), (2, 3), (3, 1), (2, 1)], Chain).
%print_chain([(1, 2), (2, 3), (3, 1)]).
%create_chain([(1, 2), (2, 3)], Chain), is_closed_chain(Chain).

domino_chain(Dominoes, Chain) :-
    create_chain(Dominoes, Chain),
    is_closed_chain(Chain).

is_closed_chain([(A, _)|Chain]) :-
    last(Chain, (_ , B)),
    A == B.

create_chain([], []).
create_chain(Dominoes, [(A, B)|Chain]) :-
    select((A, B), Dominoes, Remaining),
    extend_chain(B, Remaining, Chain).

extend_chain(Start, Dominoes, [(Start, Next)|Chain]) :-
    select((Start, Next), Dominoes, Remaining),
    extend_chain(Next, Remaining, Chain).

extend_chain(Start, Dominoes, [(Start, Next)|Chain]) :-
    select((Next, Start), Dominoes, Remaining),
    extend_chain(Next, Remaining, Chain).

extend_chain(_ , [], []).

print_chain([]).
print_chain([(A, B)|Chain]) :-
    write(A), write(":"), write(B), write(" "),
    print_chain(Chain).

solve(Dominoes) :-
    domino_chain(Dominoes, Chain),  % Randama domino grandinė
    print_chain(Chain),
    nl.
