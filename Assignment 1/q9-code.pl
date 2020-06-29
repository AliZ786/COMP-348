% This is the database
family(
  person(john, cohen, date(17,may,1990), unemployed),
        person(lily, cohen, date(9,may,1990), unemployed),[] ).
family(
  person(john, armstrong, date(7,may,1988), unemployed),
  person(lily, armstrong, date(29,may,1961), unemployed),[]).
family(
  person(eric, baily, date(7,may,1963), works( bbc, 2200)),
  person(grace, baily, date(9,may,1965), works( ntu, 1000)),
  [ person(louie, baily, date(25,may,1983), unemployed) ] ).
family(
  person(eric, fox, date(27,may,1970), works(bbc, 25200)),
  person(grace, fox, date(9,may,1971), works(ntbu, 13000)),
  [ person(louie, fox, date(5,may,1993), unemployed) ]).
family(
  person(tom, cohen, date(7,may,1960), works( bcd, 15200)),
  person(ann, cohen, date(29,may,1961), unemployed),
  [ person(pat, cohen, date(5,may,1983), works(bcd, 15200)),
    person(jim, cohen, date(5,may,1983), works(bcd, 15200))]).
family(
  person(bob, armstrong, date(12,oct,1977), works(ntnu, 12000)),
  person(liz,armstrong, date(6,oct,1975), unemployed),
  [ person(bob, armstrong, date(6,oct,1999), unemployed),
    person(sam,armstrong, date(8,oct,1998), unemployed) ]).
family(
  person(tony, oliver, date(7,may,1960), works( bbc, 35200)),
  person(anny, oliver, date(9,may,1961), unemployed),
  [ person(patty, oliver, date(8,may,1984), unemployed),
    person(jimey, oliver, date(5,may,1983), unemployed) ]).
family(
  person(jack, fox, date(27,may,1940), unemployed),
  person(jane, fox, date(9,aug,1941), works( ntu, 13050)),
  [ person(andy, fox, date(5,aug,1967), works(com, 12000)),
    person(kai, fox, date(5,jul,1969), unemployed) ]).

husband(X) :- family( X, _, _).
wife(X) :- family( _, X, _).
child(X) :- family( _, _, Children), member(X, Children).
exists(Person) :- husband(Person); wife(Person); child(Person).
dateofbirth(person(_, _, Date, _), Date).
salary(person(_, _, _, works(_, S)), S).
salary(person(_, _, _, unemployed), 0).

% Part A (This defines the totalIncome/2 rule)
% Par1 and Par2 are the parents of the household respectively, while Sal1 and Sal2 represents their salary respectively.
% Income represents their the money combined.
% childrenSalary is a list which is which takes into account all the children. The first child is stored H, while all the other are stored in T.
% The salary for the children is Sal3

totalIncome(family(Par1,Par2,[]), Income) :-
    salary(Par1, Sal1),
    salary(Par2, Sal2),
    Income is Sal1 + Sal2.

totalIncome(family(Par1, Par2, [H|T]), Income) :-
    salary(Par1, Sal1),
    salary(Par2, Sal2),
    childrenSalary([H|T], Sal3),
    Income is Sal1 + Sal2 + Sal3.

childrenSalary([], 0).
childrenSalary([H|T], Sal) :- 
    salary(H, Sal1),
    childrenSalary(T, Sal2),
    Sal is Sal1 + Sal2, !.

% Part B (This rule prints out the total income for all the families)
% A family procedure is called to call a family to determine their income
% The procedure contains Par1 and Par2 which is both of the parents.
% Chx refers to the children and add them to the salary of the parents (if the family does indeed have children)
% The Name variable is assigned from the last name of the famililes so it is easier to print them and distinguish them. This is instantiated to the name of the first parent.

printTotalIncome:-
 family(Par1,Par2,ChX),

    totalIncome(family(Par1,Par2,ChX), Income),
    person(_,Name,_,_) = Par1,

    write('The total income for the  '), 
    write(Name), 
    write(' family is:  '), 
    write(Income),
    write(' $.'),
    nl, fail.


% Part C (This rules determines which families are poor and prints out their income)
% length refers to the total number of the people in a family, which are the parents + the kids.
% Lname refers to the last name of the of the family in question.

poorFamily:-
% This write statement is used to print a message announcing the poor families

    write('The poor families are: '),nl,nl,
    family(Par1, Par2, ParX),
    totalIncome(family(Par1, Par2, ParX), Income),
    length(ParX, Nkids),
    Avg is Income/(2+Nkids), 
    


% The \+ means that we will have to prove that this false. It will only store the families when this is false, hence when they make an average salary lower than 2000$

    \+ Avg >= 2000,
    
    person(Dad, Lname, _, _) = Par1,
    salary(Par1, Sal1),

    
    write('The '), write(Lname), write(' family'), nl,

% Here it prints out the name and the salary of both the mom and the dad

    person(Mom,_,_,_) = Par2,
    salary(Par2, Sal2),
    write(Dad), write(' makes $'), write(Sal1), nl,
    write(Mom), write(' makes $'), write(Sal2), nl,

% This finds all of the children of the families and add them to the salary of the parent to determine if they are poor. 
% At the ends it prints out the final average of the families who are poor in seperate lines 

    findall(_,(
        member(Child, ParX),
        person(Cname, _, _, _) = Child,
        salary(Child, Csal),

        write(Cname), write(' makes $'), write(Csal), nl
    ),_),
    write('Their average salary is: '),
    write(Avg),write('$'),nl,
    nl, fail.


% Part D (This determines and prints out the families where the children make more money than the parents)
% IncomeOfPar is the total income of the parents
% IncomeOfChildren is the total income overall - the total income of the parents
% Par1 is the Dad, while Par2 here is the Mom

richChildren:-
    family(Par1,Par2,ChX),

    salary(Par1, Sal1),
    salary(Par2, Sal2),

    IncomeOfPar is Sal1 + Sal2,
    totalIncome(family(Par1,Par2,ChX), Income),

    
    IncomeOfChildren is Income - IncomeOfPar,

%   This will only store into the loop where the child income is less than that of the parents. Which means by looping, we would have to determine that 

    \+ IncomeOfChildren =< IncomeOfPar,

% This prints the total income of the parents 
    person(Dad,Lname,_,_) = Par1,
    person(Mom, _,_,_) = Par2,
    
    write('The '), write(Lname), 
    write(' family children are richer than the parents.'), nl,nl,
    write('Income of the Parents:'), nl,
    write(Dad), write(' makes $'), write(Sal1), nl,
    write(Mom), write(' makes $'), write(Sal2), nl, 
    write('The total income is: '),
    write(IncomeOfPar), write('$.'),
    nl,nl,

% This prints out the total income of the children

    write('Income of the Children:'), nl,
    findall(_, (
        member(Child, ChX),
        person(Cname, _,_,_) = Child,
        salary(Child, Sal),
        write(Cname), write(' makes $'), write(Sal), nl
        ), _), write('The total income is: '), 
        write(IncomeOfChildren), write('$.'),nl,
    nl, fail.
    
