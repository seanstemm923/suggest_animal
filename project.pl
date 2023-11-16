pet(dog, mammal, medium, [greaterthan10], outdoor, expensive, high, moderate).
pet(cat, mammal, small, [greaterthan13], indoor, cheap, moderate, low).
pet(goldfish, fish, small, [lessthan0], indoor, cheap, low, low).
pet(parrot, bird, small, [greaterthan13], indoor, expensive, high, moderate).
pet(turtle, reptile, small, [greaterthan10], indoor, cheap, low, low).

recommend_pet(Classification, Size, Lifespan, Livingspace, Budget, Activity, Noise, Pet) :-
    pet(Pet, Classification, Size, LifespanList, Livingspace, Budget, Activity, Noise),
    member(Lifespan, LifespanList).
start :-
    write('Type what classification of animal you are interested in (amphibian, bird, fish, mammal, reptile): '),
    read(Classification), 
    
    write('Type what size of animal you are interested in (small, medium, large): '), 
    read(Size), 
    
    write('What are the minimum number of years you wish to spend with your future pet? '), 
    read(Years), 
    get_lifespan(Years, Lifespan), 
    
    write('Do you want an indoor or outdoor pet? '), 
    read(Livingspace), 
    
    write('What is your budget: '), 
	read(Dollars), 
    get_budget(Dollars, Budget), 
    
    write('What is your preference for animal activity level? (low, moderate, high): '), 
    read(Activity), 
    
    write('What is your preference for noise? '), 
    read(Noise), 

    findall(Pet, recommend_pet(Classification, Size, Lifespan, Livingspace, Budget, Activity, Noise, Pet), Pets),
    write('Based on your preferences, these pets are recommended: '),
    write(Pets).

get_budget(Cost, cheap) :- Cost < 100.
get_budget(Cost, expensive) :- Cost >= 100.

get_lifespan(Years, lessthan0) :- Years =< 0.
get_lifespan(Years, Lifespan) :- Years >= 1, Lifespan = greaterthan1.
get_lifespan(Years, Lifespan) :- Years >= 3, Lifespan = greaterthan3.
get_lifespan(Years, Lifespan) :- Years >= 7, Lifespan = greaterthan7.
get_lifespan(Years, Lifespan) :- Years >= 10, Lifespan = greaterthan10.
get_lifespan(Years, Lifespan) :- Years >= 13, Lifespan = greaterthan13.

:- start.