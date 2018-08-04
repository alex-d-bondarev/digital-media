/* 
This homework covers Act#5 and Act#6 from initial proposal.
This is a simple logical game, where you need to find sequence of random numbers.
Every time sequence is random. You have limited ammount of tries to win.
Every try you will see numbers that were chosen previous time and how many of them were correct.

Arrays are used main class:
- int[] guess is used to store current user's guess. It is also used to manage size of helper arrays.
it is "appended" and "shortened" in LogicGame class, but in UI it is changed throw Instructions class, 
by pressing green arrow buttons. All values are reset to 0, each time game starts.

and in LogicGame class:
- int[][] allVariants -> is static array
- int[][] guessHistory -> starts as a 2D array with all values = 0. Is used for saving previous guesses
- int[] correctHistory -> is used to save all numbers of correct guesses
- int[] correctVariant -> stores correct sequance. Values are random and are generated foe each game.
                          if they are guessed during first turn - one (only) of the values is regenerated.
*/

//------------------------------------------------------//
//----------------- Global  Variables ------------------//
//------------------------------------------------------//

int firstAct = 5; // There will be acts 1-7, but in final project
WorldModel world;
// for LogicGame
int[] guess = {0, 0, 0};


//------------------------------------------------------//
//----------------- Main functionality -----------------//
//------------------------------------------------------//
void setup() {
  size(1000,600);
  background(255);
  world = new WorldModel(firstAct);
}

//----------------------------------------
void draw() {
  world.display();
}

//--------------------------------------------------------------------------------
// EFFECT: Handle mouse clicks
//--------------------------------------------------------------------------------
void mousePressed () {
  world.handleMouseEvents();
}