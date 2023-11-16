% Pet facts
pet(dog, mammal, medium, average_lifespan(10), outdoor, expensive, high, moderate, high).
pet(cat, mammal, small, average_lifespan(13), indoor, cheap, moderate, low, moderate).
pet(goldfish, fish, small, average_lifespan(5), indoor, cheap, low, low, low).
pet(parrot, bird, small, average_lifespan(20), indoor, expensive, high, moderate, moderate).
pet(turtle, reptile, small, average_lifespan(40), indoor, cheap, low, low, moderate).

% Recommendation rule
recommend_pet(Classification, Size, UserMinLifespan, Livingspace, UserBudget, Activity, Noise, Maintenance, Pet) :-
    pet(Pet, PetClassification, PetSize, average_lifespan(AvgLifespan), PetLivingspace, PetBudget, PetActivity, PetNoise, PetMaintenance),
    (Classification = n ; Classification = PetClassification),
    (Size = n ; Size = PetSize),
    (UserMinLifespan = n ; number(UserMinLifespan), AvgLifespan >= UserMinLifespan),
    (Livingspace = n ; Livingspace = PetLivingspace),
    (UserBudget = n ; number(UserBudget), UserBudget >= 100 ; PetBudget = cheap),
    (Activity = n ; Activity = PetActivity),
    (Noise = n ; Noise = PetNoise),
    (Maintenance = n ; Maintenance = PetMaintenance).

% Start of program
main :-
    writeln('Write a period after each input. If an option is (amphibian) for example, input: amphibian.'), 
    writeln('If you have no preference for a question, input: n. The less preferences you have, the higher likelihood of getting results'), 
    
    write('Type what classification of animal you are interested in (no, amphibian, bird, fish, mammal, reptile): '),
    read(Classification), 
    
    write('Type what size of animal you are interested in (no, small, medium, large): '), 
    read(Size), 
    
    write('What are the minimum number of years you wish to spend with your future pet? (n, *integer*)'), 
    read(UserMinLifespan), 
    
    write('Do you want an indoor or outdoor pet? (n, indoor, outdoor '), 
    read(Livingspace), 
    
    write('What is your budget in amount of dollars: (n, integer)'), 
    read(UserBudget), 
    
    write('What is your preference for animal activity level? (n, low, moderate, high): '), 
    read(Activity), 
    
    write('What is your preference for noise? (n, low, moderate, high)'), 
    read(Noise), 
    
    write('What is your preference for the amount of maintenance and care required? (n, low, moderate, high)'), 
    read(Maintenance),

    findall(Pet, recommend_pet(Classification, Size, UserMinLifespan, Livingspace, UserBudget, Activity, Noise, Maintenance, Pet), Duplicates),
    sort(Duplicates, Pets),
    write('Based on your preferences, these pets are recommended: '),
    write(Pets).

:- main.