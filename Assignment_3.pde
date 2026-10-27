int level = 0;
char letter = ' ';

int score = 0;
boolean gameOver = false;

int startTime;
int endTime;
int timerDuration = 10;
int timeLeft;

String message = "";

void setup() {
  size(600, 500);
  textAlign(CENTER, CENTER);
}

void draw() {

  background(15, 55, 35);

  if (level == 0) {

    fill(255);
    textSize(35);
    text("Typing Test", 300, 70);

    textSize(20);
    text("Choose a difficulty", 300, 130);

    fill(50, 150, 80);
    rect(50, 200, 140, 70, 25);

    fill(255);
    textSize(25);
    text("Easy", 120, 235);

    fill(190, 145, 45);
    rect(230, 200, 140, 70, 25);

    fill(255);
    text("Medium", 300, 235);

    fill(170, 65, 65);
    rect(410, 200, 140, 70, 25);

    fill(255);
    text("Hard", 480, 235);
  } else {

    if (gameOver == false) {

      timeLeft = timerDuration - (millis() - startTime) / 1000;

      if (timeLeft <= 0) {
        timeLeft = 0;
        gameOver = true;
        endTime = millis();
        message = "Time's Up!";
      }
    }

    fill(255);
    textSize(32);
    text("Typing Test", 300, 50);

    textSize(22);
    text("Score: " + score, 300, 110);

    if (gameOver == false) {

      textSize(20);
      text("Type this letter:", 300, 170);

      textSize(100);
      text(letter, 300, 260);

      textSize(25);
      text("Time Left: " + timeLeft, 300, 420);

      textSize(20);
      text(message, 300, 350);
    } else {

      textSize(35);
      text(message, 300, 190);

      textSize(25);
      text("Final Score: " + score, 300, 250);

      int seconds = max(1, (endTime - startTime) / 1000);
      int typingSpeed = score * 60 / seconds;

      textSize(20);
      text("Typing Speed: " + typingSpeed + " letters/min", 300, 300);
    }
  }
}

void mousePressed() {

  if (level == 0) {

    if (mouseX >= 50 && mouseX <= 190 &&
      mouseY >= 200 && mouseY <= 270) {

      level = 1;
      startGame();
    } else if (mouseX >= 230 && mouseX <= 370 &&
      mouseY >= 200 && mouseY <= 270) {

      level = 2;
      startGame();
    } else if (mouseX >= 410 && mouseX <= 550 &&
      mouseY >= 200 && mouseY <= 270) {

      level = 3;
      startGame();
    }
  }
}

void startGame() {

  score = 0;
  gameOver = false;
  message = "";
  startTime = millis();
  timeLeft = timerDuration;
  newLetter();
}

void newLetter() {

  if (level == 1) {

    int n = int(random(2));

    if (n == 0) {
      letter = 's';
    } else if (n == 1) {
      letter = 'k';
    }
  } else if (level == 2) {

    int n = int(random(4));

    if (n == 0) {
      letter = 'm';
    } else if (n == 1) {
      letter = 'r';
    } else if (n == 2) {
      letter = 't';
    } else if (n == 3) {
      letter = 'h';
    }
  } else if (level == 3) {

    int n = int(random(6));

    if (n == 0) {
      letter = 'q';
    } else if (n == 1) {
      letter = 'w';
    } else if (n == 2) {
      letter = 'p';
    } else if (n == 3) {
      letter = 'z';
    } else if (n == 4) {
      letter = 'x';
    } else if (n == 5) {
      letter = 'v';
    }
  }
}

void keyPressed() {

  if (level != 0 && gameOver == false) {

    if (millis() - startTime >= timerDuration * 1000) {

      timeLeft = 0;
      gameOver = true;
      endTime = millis();
      message = "Time's Up!";
      return;
    }

    if (key == letter) {

      score++;
      message = "Nice!";
      newLetter();
    } else {

      message = "Wrong! Game Over!";
      gameOver = true;
      endTime = millis();
    }
  }
}
