class LogicGame {
  //================================================================================
  // properties
  //================================================================================

  // For game logic
  boolean won = false;

  int currentTry;
  int maxTries = 7;
  int numOfVariants = 3;

  int[] correctHistory;
  int[] correctVariant;

  String[][] allVariants = {  {"11.jpg", "12.jpg", "13.jpg", "14.jpg"}, 
                              {"21.jpg", "22.jpg", "23.jpg", "24.jpg"}, 
                              {"31.jpg", "32.jpg", "33.jpg", "34.jpg"}, 
                              {"41.jpg", "42.jpg", "43.jpg", "44.jpg"}
                            };
  int[][] guessHistory;

  //----------------------------------------
  // For UI
  int buttonWidth;
  int buttonHeight;
  int confirmButtonX;
  int firstLineY;
  int firstLineX;
  int guessBoxSize;
  int radius;
  int shift;

  String firstLine;
  String resultText;

  PImage icon;
  Sound sound;

  //----------------------------------------
  // Other
  Instructions info;
  World model;


  //================================================================================
  // constructor
  //================================================================================
  LogicGame(Sound music) {
    buttonWidth = 25;
    buttonHeight = 10;
    confirmButtonX = 680;
    firstLineY = 80;
    firstLineX = 150;
    guessBoxSize = 50;
    shift = 70;
    firstLine = "Guesses                                                  Results";
    radius = 15;
    sound = music;
  }


  //================================================================================
  // methods
  //================================================================================

  //--------------------------------------------------------------------------------
  // EFFECT: reset game
  //--------------------------------------------------------------------------------
  void reset(World world, Instructions inf) {
    correctHistory = new int[maxTries];
    currentTry = 0;
    generateRandomCorrectVariant();
    guessToZero();
    info = inf;
    model = world;
    setHistory();
  }


  //--------------------------------------------------------------------------------
  // EFFECT: play logic game
  //--------------------------------------------------------------------------------
  void play() {
    rectMode(CORNER);
    info.showTextWindow();
    info.showText(240, 50, 900, 50, firstLine);

    //----------------------------------------
    makeGuess();
  }

  //--------------------------------------------------------------------------------
  // GIVEN: guess number
  // EFFECT: displays controlls that are needed for guess
  //--------------------------------------------------------------------------------
  void makeGuess() {
    strokeWeight(2);

    // draw boxes based on game difficulty (guess.length) and number of try (currentTry)
    // use shift variable to shift boxes
    for (int i = 0; i < guess.length; i++) {
      displayUpBtn(firstLineX+15+(shift*i), firstLineY+(shift*currentTry));
      guessBox(firstLineX+(shift*i), firstLineY+15+(shift*currentTry), allVariants[guess[i]][i]);
      displayDownBtn(firstLineX+15+(shift*i), firstLineY + guessBoxSize + 20 +(shift*currentTry));
    }

    // draw previous results
    // boxes
    for (int i = 0; i < currentTry; i++) { // line
      for (int j = 0; j < guess.length; j++) { // column
        guessBox(firstLineX+(shift*j), firstLineY+15+(shift*i), allVariants[guessHistory[i][j]][j]);
      }
      // number of correct results
      resultText = correctHistory[i] + " correct result(s)";
      info.showText(confirmButtonX-60, firstLineY+20+(shift*i), 200, 50, resultText);
    }

    // confirm guess
    displayConfirmBtn(confirmButtonX, firstLineY+15+(shift*currentTry));
  }


  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: displays up or down button in given coordinates
  //--------------------------------------------------------------------------------
  void displayUpBtn(float x, float y) {
    // move to given coordinates
    pushMatrix();
    translate(x, y);

    noStroke();
    changeFillColor(x, y);
    btnUp();

    popMatrix();
  }
  //----------------------------------------
  void displayDownBtn(float x, float y) {
    // move to given coordinates
    pushMatrix();
    translate(x, y);

    noStroke();
    changeFillColor(x, y);
    btnDown();

    popMatrix();
  }

  //--------------------------------------------------------------------------------
  // GIVEN: coordinates
  // EFFECT: draws small guessbox in given coordinates
  //--------------------------------------------------------------------------------
  void guessBox(int x, int y, String val) {
    // should be text for game instructions menu
    if (val.equals("1") || val.equals("2") || val.equals("3") || val.equals("4")) {
      // box
      fill(textBackground); 
      stroke(textColor);
      rect(x, y, guessBoxSize, guessBoxSize, 2);
      // text inside a box
      fill(textColor); 
      text(val, x+guessBoxSize/2.7, y+(guessBoxSize/1.7));
      // should show pictures for logic game
    } else {
      icon = loadImage("pics/" + val);
      image(icon, x+2, y, guessBoxSize, guessBoxSize);
    }
  }


  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: displays a confirm button in given coordinates
  //--------------------------------------------------------------------------------
  void displayConfirmBtn(float x, float y) {
    // move to given coordinates
    pushMatrix();
    translate(x, y);

    // set style
    ellipseMode(CORNER);
    stroke(10, 110, 70);
    changeCircleFillColor(x, y);
    ellipse(0, 0, radius*2, radius*2);

    popMatrix();
  }


  //--------------------------------------------------------------------------------
  // GIVEN: x and y coordinates of a button
  // EFFECT: changes fill color, depending on mouse position
  //--------------------------------------------------------------------------------
  void changeFillColor(float x, float y) {
    if (givenBtnIsSelected(x, y)) {
      fill(255);
    } else { 
      fill(100, 255, 190);
    }
  }
  //----------------------------------------
  void changeCircleFillColor(float x, float y) {
    if (confirmIsSelected(x, y)) {
      fill(255);
    } else { 
      fill(100, 255, 190);
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: displays up or down button
  //--------------------------------------------------------------------------------
  void btnUp() {
    rect(0, 0, buttonWidth, buttonHeight, 2);

    stroke(10, 110, 70);
    line(2, buttonHeight-2, 12, 2);
    line(12, 2, buttonWidth-2, buttonHeight-2);
  }
  //----------------------------------------
  void btnDown() {
    rect(0, 0, buttonWidth, buttonHeight, 2);

    stroke(10, 110, 70);
    line(2, 2, 12, buttonHeight-2);
    line(12, buttonHeight-2, buttonWidth-2, 2);
  }


  //--------------------------------------------------------------------------------
  // GIVEN: coordinates of left top corner of up/down button
  // RETURN: true if mouse is over up/down button, else - false
  //--------------------------------------------------------------------------------
  boolean givenBtnIsSelected(float x, float y) {
    return (mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight);
  }

  //--------------------------------------------------------------------------------
  // GIVEN: coordinates of center of confirm button
  // RETURN: true if mouse is over confirm button, else - false
  //--------------------------------------------------------------------------------
  boolean confirmIsSelected(float x, float y) {
    float d = dist(mouseX, mouseY, x+radius, y+radius);  
    if (d < radius) {
      return true;
    } else { 
      return false;
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: generate random correct variant
  //--------------------------------------------------------------------------------
  void generateRandomCorrectVariant() {
    correctVariant = new int[guess.length];
    for (int i = 0; i < correctVariant.length; i++) {
      correctVariant[i] = int(random(numOfVariants));
    }
  }  


  //--------------------------------------------------------------------------------
  // EFFECT: fill guess array with "0" values
  //--------------------------------------------------------------------------------
  void guessToZero() {
    for (int i = 0; i < guess.length; i++) {
      guess[i] = 0;
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: set game difficulty
  //--------------------------------------------------------------------------------
  void setHistory() {
    guessHistory = new int[maxTries][guess.length];
    for (int i = 0; i < guessHistory.length; i++) {
      for (int j = 0; j < guess.length; j++) {
        guessHistory[i][j] = 0;
      }
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: handle mouse events
  //--------------------------------------------------------------------------------
  void handleMouseEvents() {
    setGuess();
    confirmGuess();
  }


  //--------------------------------------------------------------------------------
  // EFFECT: update guess value based on buttons
  //--------------------------------------------------------------------------------
  void setGuess() {
    for (int i = 0; i < guess.length; i++) {
      //----------------------------------------
      // up btn
      // reduce only if current guess > 0
      if (givenBtnIsSelected(firstLineX+15+(shift*i), firstLineY+(shift*currentTry))) {
        if (guess[i] > 0) { 
          guess[i]--;
          sound.play("change");
        }
      }

      //----------------------------------------
      // down btn
      // increase only if current guess < 4
      if (givenBtnIsSelected(firstLineX+15+(shift*i), firstLineY + guessBoxSize + 20 +(shift*currentTry))) {
        if (guess[i] < numOfVariants) { 
          guess[i]++;
          sound.play("change");
        }
      }
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: work with confirm button
  //--------------------------------------------------------------------------------
  void confirmGuess() {
    if (confirmIsSelected(confirmButtonX, firstLineY+15+(shift*currentTry))) {
      if (currentTry < maxTries) {
          sound.play("confirm");
        // save result in guess history
        for (int i = 0; i < guess.length; i++) {
          guessHistory[currentTry][i] = guess[i];
        }
        // increment current Try
        currentTry++;
        // process guess
        processGuess();
      }
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: should be impossible to win first try 
  //         confirm guess values. If all are guessed - win 
  //         if not all are guessed -> continue if tries < guess limit and show result
  //                                -> if tries == guess limit - loose
  //--------------------------------------------------------------------------------
  void processGuess() {
    // count correct variants
    int counter = 0;
    for (int i = 0; i < guess.length; i++) {
      if (guess[i] == correctVariant[i]) {
        counter++;
      }
    }
    // process (see EFFECT)
    if (counter == correctVariant.length) {
      processWinScenario();
    } else {
      correctHistory[currentTry-1] = counter;
      processLooseScenario();
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: process winning and loosing scenarios
  //--------------------------------------------------------------------------------
  void processWinScenario() {
    if (currentTry == 1) {            // should be impossible to win first try 
      notFirstTime();
    } else {                         // you won !!!
      won = true;
      world.nextAct();
    }
  }
  //----------------------------------------
  void processLooseScenario() {
    if (currentTry >= maxTries) { // its a pity but you have lost :(                        
      won = false;
      world.nextAct();
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: update random value of correct variant to new random value
  //--------------------------------------------------------------------------------
  void notFirstTime() {
    boolean needNewVal = true;
    while (needNewVal) {
      int newValue = int(random(numOfVariants));
      if (correctVariant[int(random(guess.length))] != newValue) {
        correctVariant[int(random(guess.length))] = newValue;
        needNewVal = false;
      }
    }
  }


  //--------------------------------------------------------------------------------
  // EFFECT: increase or decrease difficulty by 1 (it should be [0;5])
  //--------------------------------------------------------------------------------
  void increaseDifficulty() {
    if (guess.length < 4) {
      guess = append(guess, 0);
          sound.play("change");
    }
  }
  //----------------------------------------
  void decreaseDifficulty() {
    if (guess.length > 1) {
      guess = shorten(guess);
          sound.play("change");
    }
  }
}