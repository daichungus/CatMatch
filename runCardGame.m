%% Run the game
function playerWon = runCardGame(difficulty, spritesheet) 
    playerWon = runCPUMode(difficulty, spritesheet);
end

%% Start versus CPU gamemode
function playerWon = runCPUMode(difficulty, spritesheet)

    % Values for setting up the background
    spriteWidth = 14;
    spriteHeight = 18;
    zoomFactor = 5;
    color = [254 254 254];

    % Declare values for sprite sheet
    blank = 1; % Blank space
    faceDown = randi(4) + 1; % Random card back sprite in top row
    firstCard = 6; % First card face
    lastCard = 25; % Last card face

    % Create the scene
    card_scene = simpleGameEngine(spritesheet, spriteHeight, spriteWidth, zoomFactor, color);

    % Generate card faces
    [cardFacesMatrix, faceDownCards] = initializeCards(card_scene, difficulty, faceDown, firstCard, lastCard);

    % Create logic matrix (indicates whether card has been flipped or not)
    logicMatrix = generateLogicMatrix(cardFacesMatrix);

    % Uncomment to cheat / debug
    %display(cardFacesMatrix)

    % Create the window and draw the scene
    drawScene(card_scene, cardFacesMatrix, faceDownCards)

    % Infinite loop
    isCompleted = false;
    numSuccessPlayer = 0;
    numSuccessCPU = 0;
    xlabel("Player: " + numSuccessPlayer + " Enemy: " + numSuccessCPU, 'FontSize', 15);

    while (~isCompleted)

        %% Player's turn
        % First card choice
        title("It's your turn!", 'FontSize', 15);
        [r1, c1, button] = getMouseInput(card_scene);
        pause(0.1);
        if button == 27 % Escape key
            break
        else
            faceDownCards = revealCard(card_scene, faceDownCards, cardFacesMatrix, r1, c1, blank);
        end

        % Second card choice
        [r2, c2, button] = getMouseInput(card_scene);
        pause(0.1);
        if button == 27 % Escape key
            break
        else
            faceDownCards = revealCard(card_scene, faceDownCards, cardFacesMatrix, r2, c2, blank);
        end

        % Compare the two chosen cards. If they match, keep them flipped up
        % Otherwise, flip them back down
        [logicMatrix, faceDownCards, numSuccessPlayer] = compareTwoFlippedCards(card_scene, faceDownCards, cardFacesMatrix, r1, c1, r2, c2, logicMatrix, faceDown, blank, numSuccessPlayer);
        
        % Update the screen
        drawScene(card_scene, cardFacesMatrix, faceDownCards);
        xlabel("Player: " + numSuccessPlayer + " Enemy: " + numSuccessCPU, 'FontSize', 15);

        %% Check if all cards have been clicked
        isCompleted = checkIfComplete(logicMatrix);
        if isCompleted
            break
        end

        %% CPU turn
        title("Enemy's turn", 'FontSize', 15);
        pause(1);
        title("Enemy is choosing cards...", 'FontSize', 15);
        pause(1);
        [r1CPU, c1CPU, r2CPU, c2CPU] = enemyTurn(difficulty, logicMatrix, cardFacesMatrix);
        [logicMatrix, faceDownCards, numSuccessCPU] = compareTwoFlippedCards(card_scene, faceDownCards, cardFacesMatrix, r1CPU, c1CPU, r2CPU, c2CPU, logicMatrix, faceDown, blank, numSuccessCPU);

        % Update the screen
        drawScene(card_scene, cardFacesMatrix, faceDownCards);
        xlabel("Player: " + numSuccessPlayer + " Enemy: " + numSuccessCPU, 'FontSize', 15);

        %% Check if all cards have been clicked
        isCompleted = checkIfComplete(logicMatrix);
    end

    % Victory message
    if (numSuccessPlayer > numSuccessCPU && isCompleted)
        xlabel("Congrats, you win!", 'FontSize', 15);
        playerWon = true;
    elseif (numSuccessCPU > numSuccessPlayer)
        xlabel("The enemy wins!", 'FontSize', 15);
        playerWon = false;
    else 
        xlabel("Wait, no one won?!", 'FontSize', 15);
        playerWon = false;
    end
    
    pause(2);
    close

end

%% Run one singleplayer game
function runSinglePlayer(difficulty, spritesheet)

    % Values for setting up the background
    spriteHeight = 18;
    spriteWidth = 14;
    zoomFactor = 5;
    color = [254 254 254];

    % Declare values for sprite sheet
    blank = 1; % Blank space
    faceDown = randi(4) + 1; % Random card in top row
    firstCard = 6; % First card face
    lastCard = 25; % Last card face

    % Create the scene
    card_scene = simpleGameEngine(spritesheet, spriteHeight, spriteWidth, zoomFactor, color);

    % Generate card faces
    [cardFacesMatrix, faceDownCards] = initializeCards(card_scene, difficulty, faceDown, firstCard, lastCard);

    % Create logic matrix (indicates whether card has been flipped or not)
    logicMatrix = generateLogicMatrix(cardFacesMatrix);

    % Uncomment to cheat / debug
    %display(cardFacesMatrix)

    % Create the window and draw the scene
    drawScene(card_scene, cardFacesMatrix, faceDownCards)

    % Infinite loop
    isCompleted = false;
    numSuccess = 0;
    xlabel("Score: " + numSuccess, 'FontSize', 16);

    while (~isCompleted)

        % First card choice
        [r1, c1, button] = getMouseInput(card_scene);
        pause(0.1);
        if button == 27
            break
        else
            faceDownCards = revealCard(card_scene, faceDownCards, cardFacesMatrix, r1, c1, blank);
        end

        % Second card choice
        [r2, c2, button] = getMouseInput(card_scene);
        pause(0.1);
        if button == 27
            break
        else
            faceDownCards = revealCard(card_scene, faceDownCards, cardFacesMatrix, r2, c2, blank);
        end

        % Compare the two chosen cards. If they match, keep them flipped up
        % Otherwise, flip them back down
        [logicMatrix, faceDownCards, numSuccess] = compareTwoFlippedCards(card_scene, faceDownCards, cardFacesMatrix, r1, c1, r2, c2, logicMatrix, faceDown, blank, numSuccess);
    
        % Update the screen
        drawScene(card_scene, cardFacesMatrix, faceDownCards);
        xlabel("Score: " + numSuccess, 'FontSize', 16);

        % Check if all cards have been clicked
        isCompleted = checkIfComplete(logicMatrix);
    end

    % Victory message
    if (isCompleted)
        title("Congrats, you win!", 'FontSize', 16);
    else
        title("Don't give up!", 'FontSize', 16);
    end

    pause(2);
    close

end

%% Enemy chooses the coordinates
function [r1, c1, r2, c2] = enemyTurn(difficulty, logicMatrix, cardFacesMatrix)
    difficultyValue = 1;

    % Set difficulty
    if difficulty == "easy"
        difficultyValue = 1;
    elseif difficulty == "normal"
        difficultyValue = 2;
    elseif difficulty == "hard"
        difficultyValue = 3;
    elseif difficulty == "lunatic"
        difficultyValue = 4;
    end

    % Determine if AI will make correct choice or not
    aiSuccess = aiMove(difficultyValue);

    % If AI makes correct choice return the coords
    if aiSuccess
        [index1, index2] = findFirstMatchingPair(cardFacesMatrix, logicMatrix);
        r1 = index1(1);
        c1 = index1(2);
        r2 = index2(1);
        c2 = index2(2);
    else
        % Random coordinates if "dumb" choice
        r1 = randi(size(logicMatrix, 1));
        c1 = randi(size(logicMatrix, 2));
        r2 = randi(size(logicMatrix, 1));
        c2 = randi(size(logicMatrix, 2));
    end
    
end

%% AI Move Function by Saumil
% This determines whether the enemy will make a successful move or not
function aiSuccess = aiMove(difficultyLevel)
    % Difficulty settings
    % 1 = Easy, 2 = Medium, 3 = Hard, 4 = Very Hard

    % Set range by difficulty (we can adjust these as we test the game if
    % we find some difficulties to be too hard or too easy)
    switch difficultyLevel
        case 1
            range = 15;
        case 2
            range = 12;
        case 3
            range = 10;
        case 4
            range = 7;
        otherwise
            error('Invalid level. Use 1-4.');
    end

    % Random number in range
    rngValue = randi(range);
    
    % Success threshold
    correctThreshold = 2;
    
    % Determine success
    aiSuccess = rngValue <= correctThreshold;
end

%% Matching card finder algorithm made by Saumil
% Find indices of first pair of unflipped cards that match 
function [index1, index2] = findFirstMatchingPair(cardMatrix, flippedMatrix)
    % cardMatrix: matrix containing the values of the cards david you can adjust this 
    % flippedMatrix: logical matrix indicating which cards are flipped (1 = flipped, 0 = not flipped) 

    % Get the size of the card matrix, again david you can adjust any
    % variables
    [rows, cols] = size(cardMatrix);

    % Initialize indices as empty (default if no match is found)
    index1 = [];
    index2 = [];

    % Loop through each card in the matrix
    for i = 1:rows
        for j = 1:cols
            % If the current card is not flipped
            if ~flippedMatrix(i, j)
                % Get the value of the current card
                cardValue = cardMatrix(i, j);
                
                % Search for a matching unflipped card
                for k = i:rows
                    % Set start column based on current row
                    if k == i
                        startCol = j + 1;
                    else
                        startCol = 1;
                    end
                    
                    for l = startCol:cols
                        % Check if the card matches and is unflipped
                        if cardMatrix(k, l) == cardValue && ~flippedMatrix(k, l)
                            % Return the indices of the matching pair
                            index1 = [i, j];
                            index2 = [k, l];
                            return;
                        end
                    end
                end
            end
        end
    end
end

%% Initialize the randomly generated card matrix values
% Then display them as face down cards
% Then return the generated card matrix and displayed card sprite values
function [cardMatrix, displayedCards] = initializeCards(card_background, difficulty, faceDown, minimum, maximum)

    dimensions = generateDimensions(difficulty);

    faceDownCards = faceDown * ones(dimensions); % Generate face down cards

    cardMatrix = generateRandNumMatrix(dimensions, minimum, maximum); % Actual values for the cards

    drawScene(card_background, cardMatrix, faceDownCards); % Draw the cards with face down overlaid

    displayedCards = faceDownCards; % Return the matrix for displayed cards on screen

end

%% Generate dimensions for a matrix based on difficulty
function dimensions = generateDimensions(difficulty)

    rows = 1;
    columns = 1;

    %% Matrix size depending on difficulty
    % values can be changed in the future
    if (strcmp(difficulty, "easy"))
        rows = 4;
        columns = 4;
    elseif (strcmp(difficulty, "normal"))
        rows = 6;
        columns = 4;
    elseif (strcmp(difficulty, "hard"))
        rows = 6;
        columns = 6;
    elseif (strcmp(difficulty, "lunatic"))
        rows = 8;
        columns = 8;
    end

    dimensions = [rows, columns];

end

%% Fill a given matrix with a give number of random numbers within the given range
% PRECONDITION: 
% DIMENSIONS MUST BE EVEN
% Min - max + 1 cannot be greater than columns (dimensions(2))
function filledCardMatrix = generateRandNumMatrix(dimensions, minimum, maximum)
    
    rows = dimensions(1);
    columns = dimensions(2);

    % Generate range of random numbers to generate
    range = maximum - minimum + 1;

    % Choose random numbers to generate
    % They will not repeat, ensuring there will be pairs
    % Expression includes min and max values
    chosenRandoms = randperm(range, columns) + minimum - 1;

    % Create pairs for the generated numbers
    chosenRandoms = repelem(chosenRandoms, rows);

    % Shuffle the elements
    shuffled = chosenRandoms(randperm(length(chosenRandoms)));

    % Shuffle the elements a couple of times to ensure randomness
    for i = 1:range
        shuffled = shuffled(randperm(length(shuffled)));
    end

    % Convert to matrix with specified dimensions
    filledCardMatrix = reshape(shuffled, rows, columns);
    
end

%% Generate logic Matrix representing face down cards
% 1 = flipped up
% 0 = face down
function logicMatrix = generateLogicMatrix(cardMatrix)
    sz = size(cardMatrix);
    logicMatrix = false(sz);
end

%% Check the values of the two flipped cards, then flip them down if not match
% Otherwise, keep them flipped up
% Update the logic matrix if they match, and return it
function [returnLogicMatrix, returnDisplayedCards, numSuccess] = compareTwoFlippedCards(card_background, displayedCards, cardMatrix, r1, c1, r2, c2, logicMatrix, faceDown, blank, numSuccess)

    % Show player what cards they chose
    drawScene(card_background, cardMatrix, displayedCards);
    pause(0.2);

    % Check if the card faces match and if both are unflipped or not
    cardsMatch = checkIfCardFacesMatch(cardMatrix, r1, c1, r2, c2);
    bothFlipped = checkIfCardsFlipped(logicMatrix, r1, c1, r2, c2);
    bothUnflipped = checkIfCardsUnflipped(logicMatrix, r1, c1, r2, c2);
    [oneIsFlipped, notFlipRow, notFlipCol] = checkIfOneIsFlipped(logicMatrix, r1, c1, r2, c2);
    cardIsItself = checkIfCardSelf(r1, c1, r2, c2);

    % Clicking on a card again flips it back down
    if (cardIsItself && bothUnflipped)
        displayedCards(r1, c1) = faceDown;
    % If cards match keep the cards flipped up and update the logic matrix
    elseif (cardsMatch && bothUnflipped)
        displayedCards(r1, c1) = blank;
        displayedCards(r2, c2) = blank;
        logicMatrix(r1, c1) = 1;
        logicMatrix(r2, c2) = 1;
        numSuccess = numSuccess + 1;
    elseif (~cardsMatch && bothUnflipped)
        % Flip cards down if do not match and also both previously unflipped
        displayedCards(r1, c1) = faceDown;
        displayedCards(r2, c2) = faceDown;

        % Update the screen
        drawScene(card_background, cardMatrix, displayedCards);
    elseif (cardsMatch && bothFlipped)
        % Don't do anything if cards match and were both already flipped
    elseif (~cardsMatch && oneIsFlipped)
        % Flip down the card that was previously not flipped
        displayedCards(notFlipRow, notFlipCol) = faceDown;
    elseif (cardsMatch && oneIsFlipped)
        % Flip down the card that was previously not flipped
        displayedCards(notFlipRow, notFlipCol) = faceDown;

    end

    % Return logic matrix regardless of outcome
    returnLogicMatrix = logicMatrix;
    returnDisplayedCards = displayedCards;
end

%% Checks if two unflipped cards match or not 
% Returns a boolean value
function matches = checkIfCardFacesMatch(cardMatrix, r1, c1, r2, c2)
    
    % Check if cards are the same face or not
    facesMatch = (cardMatrix(r1, c1) == cardMatrix(r2, c2));

    matches = facesMatch;
end

%% Checks if two cards are both unflipped
function bothUnflipped = checkIfCardsUnflipped(logicMatrix, r1, c1, r2, c2)

    % Check if both are unflipped
    bothUnflipped = (logicMatrix(r1, c1) == 0) && (logicMatrix(r2, c2) == 0);

end

%% Checks if two cards are both already flipped
function bothFlipped = checkIfCardsFlipped(logicMatrix, r1, c1, r2, c2)
    bothFlipped = (logicMatrix(r1, c1) == 1) && (logicMatrix(r2, c2) == 1);
end

%% Checks if one card is flipped or not, returns the index of the card NOT already flipped
function [oneFlipped, notFlipRow, notFlipCol] = checkIfOneIsFlipped(logicMatrix, r1, c1, r2, c2)
    
    % Default values
    notFlipRow = r1;
    notFlipCol = c1;

    firstFlipped = (logicMatrix(r1, c1) == 1) && (logicMatrix(r2, c2) == 0);

    secondFlipped = (logicMatrix(r1, c1) == 0) && (logicMatrix(r2, c2) == 1);

    oneFlipped = firstFlipped || secondFlipped;

    if (firstFlipped)
        notFlipRow = r2;
        notFlipCol = c2;
    elseif (secondFlipped)
        notFlipRow = r1;
        notFlipCol = c1;
    end

end

%% Checks if the card is itself
% Returns true if it is itself
function cardIsItself = checkIfCardSelf(r1, c1, r2, c2)
    cardIsItself = (r1 == r2) && (c1 == c2);
end

%% Returns the number of flipped cards in the logic matrix
function output = numOfFlippedCards(logicMatrix)

    % Get dimensions and size of the matrix
    [row, column] = size(logicMatrix);
    flippedNum = 0;
    
    % Check if cards are flipped or not
    for i = 1:row
        for j = 1:column
            if logicMatrix(i, j) == 1
                flippedNum = flippedNum + 1;
            end
        end
    end

    output = flippedNum;
end

%% Checks if all cards have been flipped up or not
% False = not complete. True = game is complete.
function isComplete = checkIfComplete(logicMatrix)
    total = numel(logicMatrix);
    flippedNum = numOfFlippedCards(logicMatrix);

    % Output value
    isComplete = (flippedNum >= total);
end

%% Flip a single card up given the row and column number
% In other words, reveal it
function updateDisplayCards = revealCard(card_background, displayedCards, cardMatrix, r, c, blank)
    
    % Graphically update the location of flipped card by removing face down card
    displayedCards(r, c) = blank;
    drawScene(card_background, cardMatrix, displayedCards);

    % Return updated displayed cards
    updateDisplayCards = displayedCards;

end