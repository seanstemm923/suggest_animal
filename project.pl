% Pet facts
pet(dog, mammal, medium, average_lifespan(10), outdoor, expensive, high, moderate, high).
pet(cat, mammal, small, average_lifespan(13), indoor, cheap, moderate, low, moderate).
pet(goldfish, fish, small, average_lifespan(5), indoor, cheap, low, low, low).
pet(parrot, bird, small, average_lifespan(20), indoor, expensive, high, moderate, moderate).
pet(turtle, reptile, small, average_lifespan(40), indoor, cheap, low, low, moderate).

% Recommendation rule
recommend_pet(Classification, Size, UserMinLifespan, Livingspace, UserBudget, Activity, Noise, Maintenance, Pet) :-
    pet(Pet, Classification, Size, average_lifespan(AvgLifespan), Livingspace, PetBudget, Activity, Noise, PetMaintenance),
    AvgLifespan >= UserMinLifespan,
    (UserBudget >= 100 ; PetBudget = cheap),
    Maintenance = PetMaintenance.

% Start of program
start :-
    write('Type what classification of animal you are interested in (amphibian, bird, fish, mammal, reptile): '),
    read(Classification), 
    
    write('Type what size of animal you are interested in (small, medium, large): '), 
    read(Size), 
    
    write('What are the minimum number of years you wish to spend with your future pet? '), 
    read(UserMinLifespan), 
    
    write('Do you want an indoor or outdoor pet? '), 
    read(Livingspace), 
    
    write('What is your budget in amount of dollars: '), 
    read(UserBudget), 
    
    write('What is your preference for animal activity level? (low, moderate, high): '), 
    read(Activity), 
    
    write('What is your preference for noise? (low, moderate, high)'), 
    read(Noise), 
    
    write('What is your preference for the amount of maintenance and care required? (low, moderate, high)'), 
    read(Maintenance),

    findall(Pet, recommend_pet(Classification, Size, UserMinLifespan, Livingspace, UserBudget, Activity, Noise, Maintenance, Pet), Pets),
    write('Based on your preferences, these pets are recommended: '),
    write(Pets).




% Start the program
:- start.