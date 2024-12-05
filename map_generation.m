clear;
clc;

%Title Screen
scene0 = simpleGameEngine("Retro_2.png", 16,16,6,[36,128,51]);

treeSprite1 = 1127;
treeSprite2 = 1128;
treeSprite3 = 1129;
treeSprite4 = 1131;
treeSprite5 = 1130;
rockSprite = 76;
pathSpriteH = 569;
house1 = 1133;
house2 = 1134;
house3 = 1141;
house4 = 1142;
shop1 = 1124;
shop2 = 1125;
shop3 = 1126;
mailbox = 1139;
firehydrant = 1140;
mushroomSprite = 1132;
flowerSprite = 1138;

%Letters
A = 1142 - 35*2 - 2;
C = 1142 - 35*2;
M = 1142 - 35*2 + 10;
T = 1142 - 35 + 4;
H = 1142 - 35*2 + 5;


%Title Screen Sprites
TitleScreen = ones(9,9);
TitleScreen(1,4) = C;
TitleScreen(1,5) = A;
TitleScreen(1,6) = T;
TitleScreen(2,3) = M;
TitleScreen(2,4) = A;
TitleScreen(2,5) = T;
TitleScreen(2,6) = C;
TitleScreen(2,7) = H;
TitleScreen(6,1:9) = pathSpriteH;
TitleScreen(7,8) = shop2;
TitleScreen(5,3) = shop3;
TitleScreen(5,1) = house1;
TitleScreen(5,2) = house2;
TitleScreen(5,6) = house3;
TitleScreen(5,7) = mailbox;
TitleScreen(7,2) = house4;
TitleScreen(7,5) = house1;
TitleScreen(7,3) = firehydrant;
TitleScreen(1,1) = treeSprite1;
TitleScreen(1,9) = treeSprite2;
TitleScreen(3,4) = flowerSprite;
TitleScreen(4,8) = mushroomSprite;
TitleScreen(9,2) = treeSprite3;
TitleScreen(8,6) = flowerSprite;
TitleScreen(9,8) = treeSprite5;


drawScene  (scene0,TitleScreen)
xlabel("Press p to play or q to quit!")
MapOn = 1;
GameOn = 0;
while MapOn == 1
    drawScene(scene0,TitleScreen)
    Input = getKeyboardInput(scene0);

    if Input == 'q'
        break
    elseif Input == 'p'
        GameOn = 1;
        break
    end
end
close

%Main Gameplay
if GameOn ==1
    scene1 = simpleGameEngine("Retro_2.png", 16,16,6,[36,128,51]);
    evilcollide = 33;
    grassborder = 6;
    catSprite = 276;
    npcSprite = 1121;
    enemySprite = 277;
    treeSprite1 = 1127;
    treeSprite2 = 1128;
    treeSprite3 = 1129;
    treeSprite4 = 1131;
    treeSprite5 = 1130;
    grassSprite = 71;
    rockSprite = 76;
    pathSpriteV = 605;
    pathSpriteH = 569;
    pathturn1 = 563;
    pathturn2 = 561;
    pathturn3 = 631;
    pathturn4 = 633;
    house1 = 1133;
    house2 = 1134;
    house3 = 1141;
    house4 = 1142;
    shop1 = 1124;
    shop2 = 1125;
    shop3 = 1126;
    benchSprite = 1136;
    ctpSprite = 531;
    mushroomSprite = 1132;
    flowerSprite = 1138;
    mailbox = 1139;
    firehydrant = 1140;


    %Defining Dimensions of Maps

    fullMap = ones(18,54);
    fullForeground = ones(18,54);

    %%Programming in pathways for user to follow
    fullMap(16:17,3) = pathSpriteV;
    fullMap(15,3) = pathturn2;
    fullMap(15,4:6) = pathSpriteH;
    fullMap(15,7) = pathturn4;
    fullMap(13:14,7) = pathSpriteV;
    fullMap(12,7) = pathturn1;
    fullMap(12,6) = pathSpriteH;
    fullMap(12,5) = pathturn3;
    fullMap(8:11,5) = pathSpriteV;
    fullMap(7,3) = pathturn3;
    fullMap([3,7],4:6) = pathSpriteH;
    fullMap(7,7) = pathturn4;
    fullMap(4:6,[3,7]) = pathSpriteV;
    fullMap(3,3) = pathturn2;
    fullMap(3,7) = pathturn1;
    fullMap(5,[8,9]) = pathSpriteH;
    fullMap(5,10:13) = pathSpriteH;
    fullMap(5,14) = pathturn1;
    fullMap(6:9,14) = pathSpriteV;
    fullMap([10,11],14) = pathSpriteV;
    fullMap(12,14) = pathturn4;
    fullMap(12,[12,13]) = pathSpriteH;
    fullMap(12,11) = pathturn2;
    fullMap([13,14],11) = pathSpriteV;
    fullMap(15,11) = pathturn3;
    fullMap(15,[12,13]) = pathSpriteH;
    fullMap(15,14) = pathturn1;
    fullMap(16,14) = pathSpriteV;
    fullMap(17,14) = pathturn3;
    fullMap(17,15:20) = pathSpriteH;
    fullMap(17,21) = pathturn4;
    fullMap(16,21) = pathturn2;
    fullMap(16,22:25) = pathSpriteH;
    fullMap(16,26) = pathturn4;
    fullMap(15,26) = pathSpriteV;
    fullMap(14,26) = pathturn1;
    fullMap(14,23:25) = pathSpriteH;
    fullMap(14,22) = pathturn3;
    fullMap(9:13,22) = pathSpriteV;
    fullMap(8,22) = pathturn1;
    fullMap(8,21) = pathSpriteH;
    fullMap(8,20) = pathturn3;
    fullMap(3:7,20) = pathSpriteV;
    fullMap(2,20) = pathturn2;
    fullMap(2,[21,22]) = pathSpriteH;
    fullMap(2,23) = pathturn1;
    fullMap([3,4],23) = pathSpriteV;
    fullMap(5,23) = pathturn3;
    fullMap(5,24:31) = pathSpriteH;
    fullMap(5,32) = pathturn1;
    fullMap(6,32) = pathturn3;
    fullMap(6,[33,34]) = pathSpriteH;
    fullMap(6,35) = pathturn1;
    fullMap(7,35) = pathSpriteV;
    fullMap(8,35) = pathturn4;
    fullMap(8,[33,34]) = pathSpriteH;
    fullMap(8,32) = pathturn2;
    fullMap(9:11,32) = pathSpriteV;
    fullMap(12,32) = pathturn4;
    fullMap(12,[30,31]) = pathSpriteH;
    fullMap(12,29) = pathturn2;
    fullMap(13:15,29) = pathSpriteV;
    fullMap(16,29) = pathturn3;
    fullMap(16,[30,31]) = pathSpriteH;
    fullMap(16,32) = pathturn1;
    fullMap(17,32) = pathturn3;
    fullMap(17,33:42) = pathSpriteH;
    fullMap(17,43) = pathturn4;
    fullMap(16,43) = pathSpriteV;
    fullMap(15,43) = pathturn1;
    fullMap(15,39:42) = pathSpriteH;
    fullMap(15,38) = pathturn3;
    fullMap([13,14],38) = pathSpriteV;
    fullMap(12,38) = pathturn2;
    fullMap(12,39:42) = pathSpriteH;
    fullMap(12,43) = pathturn4;
    fullMap(7:11,43) = pathSpriteV;
    fullMap(6,43) = pathturn1;
    fullMap(6,[41,42]) = pathSpriteH;
    fullMap(6,40) = pathturn3;
    fullMap([4,5],40) = pathSpriteV;
    fullMap(3,40) = pathturn2;
    fullMap(3,41) = pathSpriteH;
    fullMap(3,42) = pathturn4;
    fullMap(2,42) = pathturn2;
    fullMap(2,43:48) = pathSpriteH;
    fullMap(2,49) = pathturn1;
    fullMap([3,4],49) = pathSpriteV;
    fullMap(5,49) = pathturn4;
    fullMap(5,48) = pathSpriteH;
    fullMap(5,47) = pathturn2;
    fullMap([6,7],47) = pathSpriteV;
    fullMap(8,47) = pathturn3;
    fullMap(8,48:52) = pathSpriteH;
    fullMap(8,53) = pathturn1;
    fullMap(9,53) = pathSpriteV;
    fullMap(10,53) = pathturn4;
    fullMap(10,[51,52]) = pathSpriteH;
    fullMap(10,50) = pathturn2;
    fullMap(11,50) = pathSpriteV;
    fullMap(12,49:51) = pathSpriteV;
    fullMap(13,48:52) = pathSpriteV;
    fullMap(14,47:53) = pathSpriteV;
    fullMap(15,48:52) = pathSpriteV;
    fullMap(16,49:51) = pathSpriteV;
    fullMap(17,50) = pathSpriteV;

    %%Full Map Border
    fullForeground(1:end,1) = grassborder;
    fullForeground(1,1:end) = grassborder;
    fullForeground(1:end,end) = grassborder;
    fullForeground(end,1:end) = grassborder;

    fullMap(1:end,1) = evilcollide;
    fullMap(1,1:end) = evilcollide;
    fullMap(1:end,end) = evilcollide;
    fullMap(end,1:end) = evilcollide;


    %%Screen 1 Sprites
    fullForeground(11,4) = house1;
    fullForeground(14,6) = house2;
    fullForeground(16,4) = house3;
    fullForeground(12,8) = house4;
    fullForeground(13,3) = house4;
    fullForeground(16,8) = house1;
    fullForeground(16,2) = treeSprite1;
    fullForeground(14,8) = rockSprite;
    fullForeground(17,6) = grassSprite;
    fullForeground(11,2) = grassSprite;
    fullForeground(11,6) = treeSprite3;
    fullForeground(16,5) = mailbox;
    fullForeground(13,5) = firehydrant;
    fullForeground(2,5) = shop2;
    fullForeground(7,8) = shop3;

    fullMap(11,4) = evilcollide;
    fullMap(14,6) = evilcollide;
    fullMap(16,4) = evilcollide;
    fullMap(12,8) = evilcollide;
    fullMap(13,3) = evilcollide;
    fullMap(16,8) = evilcollide;
    fullMap(16,2) = evilcollide;
    fullMap(14,8) = evilcollide;
    fullMap(11,6) = evilcollide;
    fullMap(16,5) = evilcollide;
    fullMap(13,5) = evilcollide;
    fullMap(2,5) = evilcollide;
    fullMap(7,8) = evilcollide;

    %%Screen 2 Sprites
    fullForeground(5,5) = ctpSprite;
    fullForeground(2,3) = npcSprite;
    fullForeground(4,8) = npcSprite;
    fullForeground(6,6) = npcSprite;
    fullForeground(5,2) = npcSprite;
    fullForeground(3,2) = house1;
    fullForeground(7,2) = house2;
    fullForeground(8,6) = house1;
    fullForeground(6,8) = house3;
    fullForeground(2,7) = house4;
    fullForeground(8,3) = grassSprite;
    fullForeground(2,9) = grassSprite;
    fullForeground(8,8) = treeSprite4;

    fullMap(2,7) = evilcollide;
    fullMap(6,8) = evilcollide;
    fullMap(8,6) = evilcollide;
    fullMap(7,2) = evilcollide;
    fullMap(3,2) = evilcollide;
    fullMap(5,5) = evilcollide;
    fullMap(2,3) = evilcollide;
    fullMap(4,8) = evilcollide;
    fullMap(6,6) = evilcollide;
    fullMap(5,2) = evilcollide;
    fullMap(8,8) = evilcollide;

    %%Screen 3 Sprites
    fullForeground(2,11) = house1;
    fullForeground(4,12) = house2;
    fullForeground(6,11) = house3;
    fullForeground(8,12) = house4;
    fullForeground(4,14) = treeSprite1;
    fullForeground(6,16) = rockSprite;
    fullForeground(2,17) = grassSprite;
    fullForeground(3,16) = treeSprite2;
    fullForeground(8,15) = treeSprite3;
    fullForeground(7,17) = treeSprite4;
    fullForeground(2,13) = rockSprite;
    fullForeground(5,17) = treeSprite1;

    fullMap(2,11) = evilcollide;
    fullMap(4,12) = evilcollide;
    fullMap(6,11) = evilcollide;
    fullMap(8,12) = evilcollide;
    fullMap(4,14) = evilcollide;
    fullMap(6,16) = evilcollide;
    fullMap(3,16) = evilcollide;
    fullMap(8,15) = evilcollide;
    fullMap(7,17) = evilcollide;
    fullMap(2,13) = evilcollide;
    fullMap(5,17) = evilcollide;

    %%Screen 4 Sprites
    fullForeground(15,15) = enemySprite;
    fullForeground(16,11) = treeSprite1;
    fullForeground(16,17) = mushroomSprite;
    fullForeground(14,12) = grassSprite;
    fullForeground(13,13) = treeSprite2;
    fullForeground(11,15) = treeSprite3;
    fullForeground(13,17) = treeSprite4;
    fullForeground(11,11) = rockSprite;
    fullForeground(14,16) = treeSprite1;
    fullForeground(11,17) = treeSprite2;
    fullForeground(15,17) = treeSprite3;

    fullMap(15,15) = evilcollide;
    fullMap(16,11) = evilcollide;
    fullMap(16,17) = evilcollide;
    fullMap(13,13) = evilcollide;
    fullMap(11,15) = evilcollide;
    fullMap(13,17) = evilcollide;
    fullMap(11,11) = evilcollide;
    fullMap(14,16) = evilcollide;
    fullMap(11,17) = evilcollide;
    fullMap(15,17) = evilcollide;

    %Screen 5 Sprites
    fullForeground(11,21) = mushroomSprite;
    fullForeground(12,20) = rockSprite;
    fullForeground(14,21) = treeSprite1;
    fullForeground(16,20) = mushroomSprite;
    fullForeground(15,23) = treeSprite2;
    fullForeground(15,25) = mushroomSprite;
    fullForeground(17,26) = treeSprite3;
    fullForeground(17,24) = grassSprite;
    fullForeground(11,26) = treeSprite1;
    fullForeground(12,24) = mushroomSprite;
    fullForeground(13,26) = treeSprite4;
    fullForeground(11,23) = treeSprite3;

    fullMap(11,21) = evilcollide;
    fullMap(12,20) = evilcollide;
    fullMap(14,21) = evilcollide;
    fullMap(16,20) = evilcollide;
    fullMap(15,23) = evilcollide;
    fullMap(15,25) = evilcollide;
    fullMap(17,26) = evilcollide;
    fullMap(11,26) = evilcollide;
    fullMap(12,24) = evilcollide;
    fullMap(13,26) = evilcollide;
    fullMap(11,23) = evilcollide;

    %%Screen 6 Sprites
    fullForeground(7,21) = mushroomSprite;
    fullForeground(5,22) = treeSprite1;
    fullForeground(3,21) = treeSprite2;
    fullForeground(4,24) = mushroomSprite;
    fullForeground(3,25) = treeSprite3;
    fullForeground(4,26) = grassSprite;
    fullForeground(6,25) = mushroomSprite;
    fullForeground(7,23) = treeSprite2;
    fullForeground(8,24) = treeSprite4;
    fullForeground(8,26) = treeSprite1;
    fullForeground(2,26) = rockSprite;
    fullForeground(6,24) = enemySprite;

    fullMap(7,21) = evilcollide;
    fullMap(5,22) = evilcollide;
    fullMap(3,21) = evilcollide;
    fullMap(4,24) = evilcollide;
    fullMap(3,25) = evilcollide;
    fullMap(6,25) = evilcollide;
    fullMap(7,23) = evilcollide;
    fullMap(8,24) = evilcollide;
    fullMap(8,26) = evilcollide;
    fullMap(2,26) = evilcollide;
    fullMap(6,24) = evilcollide;

    %%Screen 7 Sprites
    fullForeground(2,29) = flowerSprite;
    fullForeground(3,30) = treeSprite1;
    fullForeground(2,31) = treeSprite2;
    fullForeground(4,32) = flowerSprite;
    fullForeground(5,34) = grassSprite;
    fullForeground(3,35) = flowerSprite;
    fullForeground(2,34) = rockSprite;
    fullForeground(7,33) = treeSprite4;
    fullForeground(8,31) = flowerSprite;
    fullForeground(7,29) = flowerSprite;
    fullForeground(6,30) = grassSprite;
    fullForeground(8,29) = rockSprite;

    fullMap(2,29) = evilcollide;
    fullMap(3,30) = evilcollide;
    fullMap(2,31) = evilcollide;
    fullMap(4,32) = evilcollide;
    fullMap(3,35) = evilcollide;
    fullMap(2,34) = evilcollide;
    fullMap(7,33) = evilcollide;
    fullMap(8,31) = evilcollide;
    fullMap(7,29) = evilcollide;
    fullMap(8,29) = evilcollide;

    %%Screen 8 Sprites
    fullForeground(11,31) = flowerSprite;
    fullForeground(13,33) = flowerSprite;
    fullForeground(13,30) = grassSprite;
    fullForeground(17,29) = mushroomSprite;
    fullForeground(16,35) = treeSprite1;
    fullForeground(11,29) = treeSprite2;
    fullForeground(16,33) = rockSprite;
    fullForeground(15,30) = flowerSprite;
    fullForeground(11,35) = treeSprite4;
    fullForeground(14,34) = grassSprite;
    fullForeground(12,34) = treeSprite3;
    fullForeground(13,35) = rockSprite;

    fullMap(11,31) = evilcollide;
    fullMap(13,33) = evilcollide;
    fullMap(17,29) = evilcollide;
    fullMap(16,35) = evilcollide;
    fullMap(11,29) = evilcollide;
    fullMap(16,33) = evilcollide;
    fullMap(15,30) = evilcollide;
    fullMap(11,35) = evilcollide;
    fullMap(12,34) = evilcollide;
    fullMap(13,35) = evilcollide;

    %%Screen 9 Sprites
    fullForeground(11,40) = benchSprite;
    fullForeground(11,39) = flowerSprite;
    fullForeground(11,41) = flowerSprite;
    fullForeground(16,39) = treeSprite2;
    fullForeground(14,41) = enemySprite;
    fullForeground(15,44) = treeSprite3;
    fullForeground(13,43) = treeSprite5;
    fullForeground(13,40) = treeSprite1;
    fullForeground(14,39) = grassSprite;
    fullForeground(17,44) = treeSprite4;
    fullForeground(16,41) = treeSprite5;
    fullForeground(11,44) = grassSprite;

    fullMap(11,40) = evilcollide;
    fullMap(11,39) = evilcollide;
    fullMap(11,41) = evilcollide;
    fullMap(16,39) = evilcollide;
    fullMap(14,41) = evilcollide;
    fullMap(15,44) = evilcollide;
    fullMap(13,43) = evilcollide;
    fullMap(13,40) = evilcollide;
    fullMap(17,44) = evilcollide;
    fullMap(16,41) = evilcollide;

    %%Screen 10 Sprites
    fullForeground(8,38) = grassSprite;
    fullForeground(6,39) = rockSprite;
    fullForeground(7,41) = treeSprite4;
    fullForeground(8,42) = mushroomSprite;
    fullForeground(7,44) = rockSprite;
    fullForeground(4,42) = grassSprite;
    fullForeground(2,38) = treeSprite4;
    fullForeground(4,39) = mushroomSprite;
    fullForeground(3,44) = treeSprite4;
    fullForeground(5,43) = mushroomSprite;
    fullForeground(2,41) = rockSprite;

    fullMap(6,39) = evilcollide;
    fullMap(7,41) = evilcollide;
    fullMap(8,42) = evilcollide;
    fullMap(7,44) = evilcollide;
    fullMap(2,38) = evilcollide;
    fullMap(4,39) = evilcollide;
    fullMap(3,44) = evilcollide;
    fullMap(5,43) = evilcollide;
    fullMap(2,41) = evilcollide;

    %%Screen 11 Sprites
    fullForeground(3,47) = rockSprite;
    fullForeground(4,48) = grassSprite;
    fullForeground(5,51) = mushroomSprite;
    fullForeground(7,50) = treeSprite4;
    fullForeground(6,53) = rockSprite;
    fullForeground(3,52) = grassSprite;
    fullForeground(2,53) = treeSprite4;


    fullMap(3,47) = evilcollide;
    fullMap(5,51) = evilcollide;
    fullMap(7,50) = evilcollide;
    fullMap(6,53) = evilcollide;
    fullMap(2,53) = evilcollide;

    %%Screen 12 Sprites
    fullForeground(14,50) = enemySprite;

    fullMap(14,50) = evilcollide;

    %Difficulty and lives
    Difficulty = ["easy","normal","hard","lunatic"];
    DiffIn = 1;
    Lives = 2;

    %Initializing variables for movement loop
    R=8;
    C=3;
    X=10;
    Y=1;
    mapseen = fullMap(X:X+8,Y:Y+8);
    foreseen = fullForeground(X:X+8,Y:Y+8);
    foreseen(R,C) = catSprite;
    drawScene(scene1,mapseen,foreseen);

    %%Movement and integration loop
    playeralive = 1;
    while playeralive == 1
        keyvar = getKeyboardInput(scene1);
        mapseen = fullMap(X:X+8,Y:Y+8);
        foreseen = fullForeground(X:X+8,Y:Y+8);
        foreseen(R,C) = catSprite;

        if isequal(keyvar, "q")
            break
        end

        if isequal(Lives,2)
            xlabel('Lives: 2')
        elseif isequal(Lives,1)
            xlabel('Lives: 1')
        else
            xlabel('Game Over! Press q to close')
        end

        if isequal(keyvar,'uparrow')
            if isequal(R,1)
                X = X-9;
                R=R+8;
                mapseen = fullMap(X:X+8,Y:Y+8);
                foreseen = fullForeground(X:X+8,Y:Y+8);
                foreseen(R,C) = catSprite;
                drawScene(scene1,mapseen,foreseen)
            else
                if isequal(mapseen(R-1,C),evilcollide)
                else
                    foreseen(R,C) = 1;
                    R=R-1;

                    foreseen(R,C) = catSprite;
                end
            end
        elseif R ~= 1
            if isequal(foreseen(R-1,C),enemySprite) && isequal(keyvar, "t")
                if DiffIn ==1
                    uiwait(msgbox("You'll never beat the boss if you can't beat me!","Evil Ryley","modal"))
                elseif DiffIn == 2
                    uiwait(msgbox("ARGH!!!! DON'T TRY TO MESS WITH ME!!!!","Evil Alexys","modal"))
                elseif DiffIn == 3
                    uiwait(msgbox("Honestly I'd rather be fishing right now...","Evil Kyle","modal"))
                elseif DiffIn == 4
                    uiwait(msgbox("I'm never giving you the dabloons back!!!!","Evil Boss Casper","modal"))
                end
                Win = runCardGame(Difficulty(DiffIn),"morgan.png");
                if Win ==1
                    DiffIn = DiffIn + 1;
                    if DiffIn > 4
                        xlabel("You win! Press q to close")
                    end
                end
                if Win == 0
                    if Lives > 0
                        Lives = Lives - 1;
                    elseif Lives == 0
                        xlabel('Game Over! Press q to close')
                        playeralive = 0;
                    end
                end
            end
        end

        if isequal(keyvar,'rightarrow')
            if isequal(C,9)
                Y=Y+9;
                C=C-8;
                mapseen = fullMap(X:X+8,Y:Y+8);
                foreseen = fullForeground(X:X+8,Y:Y+8);
                foreseen(R,C) = catSprite;
                drawScene(scene1,mapseen,foreseen)
            else
                if isequal(mapseen(R,C+1),evilcollide)
                else
                    foreseen(R,C) = 1;
                    C=C+1;
                    foreseen(R,C) = catSprite;
                end
            end
        elseif C ~= 9
            if isequal(foreseen(R,C+1),enemySprite) && isequal(keyvar, "t")
                if DiffIn ==1
                    uiwait(msgbox("You'll never beat the boss if you can't beat me!","Evil Ryley","modal"))
                elseif DiffIn == 2
                    uiwait(msgbox("ARGH!!!! DON'T TRY TO MESS WITH ME!!!!","Evil Alexys","modal"))
                elseif DiffIn == 3
                    uiwait(msgbox("Honestly I'd rather be fishing right now...","Evil Kyle","modal"))
                elseif DiffIn == 4
                    uiwait(msgbox("I'm never giving you the dabloons back!!!!","Evil Boss Casper","modal"))
                end
                Win = runCardGame(Difficulty(DiffIn),"morgan.png");
                if Win ==1
                    DiffIn = DiffIn + 1;
                    if DiffIn > 4
                        xlabel("You win! Press q to close")
                    end
                end
                if Win == 0
                    if Lives > 0
                        Lives = Lives - 1;
                    elseif Lives == 0
                        xlabel('Game Over! Press q to close')
                        playeralive = 0;
                    end
                end
            end
        end

        if isequal(keyvar,'leftarrow')
            if isequal(C,1)
                Y=Y-9;
                C=C+8;
                mapseen = fullMap(X:X+8,Y:Y+8);
                foreseen = fullForeground(X:X+8,Y:Y+8);
                foreseen(R,C) = catSprite;
                drawScene(scene1,mapseen,foreseen)
            else
                if isequal(mapseen(R,C-1),evilcollide)
                else
                    foreseen(R,C) = 1;
                    C=C-1;
                    foreseen(R,C) = catSprite;
                end
            end
        elseif C ~= 1
            if isequal(foreseen(R,C-1),enemySprite) && isequal(keyvar, "t")
                if DiffIn ==1
                    uiwait(msgbox("You'll never beat the boss if you can't beat me!","Evil Ryley","modal"))
                elseif DiffIn == 2
                    uiwait(msgbox("ARGH!!!! DON'T TRY TO MESS WITH ME!!!!","Evil Alexys","modal"))
                elseif DiffIn == 3
                    uiwait(msgbox("Honestly I'd rather be fishing right now...","Evil Kyle","modal"))
                elseif DiffIn == 4
                    uiwait(msgbox("I'm never giving you the dabloons back!!!!","Evil Boss Casper","modal"))
                end
                Win = runCardGame(Difficulty(DiffIn),"morgan.png");
                if Win ==1
                    DiffIn = DiffIn + 1;
                    if DiffIn > 4
                        xlabel("You win! Press q to close")
                    end
                end
                if Win == 0
                    if Lives > 0
                        Lives = Lives - 1;
                    elseif Lives == 0
                        xlabel('Game Over! Press q to close')
                        playeralive = 0;
                    end
                end
            end
        end


        if isequal(keyvar,'downarrow')
            if isequal(R,9)
                X=X+9;
                R=R-8;
                mapseen = fullMap(X:X+8,Y:Y+8);
                foreseen = fullForeground(X:X+8,Y:Y+8);
                foreseen(R,C) = catSprite;
                drawScene(scene1,mapseen,foreseen)
            else
                if isequal(mapseen(R+1,C),evilcollide)
                else
                    foreseen(R,C) = 1;
                    R=R+1;
                    foreseen(R,C) = catSprite;
                end
            end
        elseif R ~= 9
            if isequal(foreseen(R+1,C),enemySprite) && isequal(keyvar, "t")
                if DiffIn ==1
                    uiwait(msgbox("You'll never beat the boss if you can't beat me!","Evil Ryley","modal"))
                elseif DiffIn == 2
                    uiwait(msgbox("ARGH!!!! DON'T TRY TO MESS WITH ME!!!!","Evil Alexys","modal"))
                elseif DiffIn == 3
                    uiwait(msgbox("Honestly I'd rather be fishing right now...","Evil Kyle","modal"))
                elseif DiffIn == 4
                    uiwait(msgbox("I'm never giving you the dabloons back!!!!","Evil Boss Casper","modal"))
                end
                Win = runCardGame(Difficulty(DiffIn),"morgan.png");
                if Win ==1
                    DiffIn = DiffIn + 1;
                    if DiffIn > 4
                        xlabel("You win! Press q to close")
                    end
                end
                if Win == 0
                    if Lives > 0
                        Lives = Lives - 1;
                    elseif Lives == 0
                        xlabel('Game Over! Press q to close')
                        playeralive = 0;
                    end
                end
            end
        end
        drawScene(scene1,mapseen,foreseen)
    end
end
close