class Snake{

	int xpos;
	int ypos;
	String direction;
	int snakesize;
	color snakecolor; //color is a "data type" in Processing

	Snake(int initialx, int initialy, color initialcolor, int intitialsize, String initialdirection){ //CONSTRUCTOR
		xpos=initialx;//initial location
		ypos=initialy;
		snakecolor = initialcolor;
		snakesize = intitialsize;
		direction = initialdirection;
		
	}

	// ACTUAL MOVEMENT
	void move() {
		if (direction == "up") {
			if (ypos > 0 + snakesize/2){ //0 MEANS THE TOP EDGE IN THIS CASE. checking if the center of the snake is near top line/edge of screen.
				ypos = ypos-snakesize;
			}
			else println("DEAD");

		}
		if (direction == "down") {
			if (ypos < height-snakesize/2){ 
				ypos = ypos+snakesize;
			}
			else println("DEAD");
			
		}
		if (direction == "left") {
			if (xpos > 0+snakesize/2){
				xpos = xpos-snakesize;
			}
			else println("DEAD");
		}
		if (direction == "right") {
			if (xpos < width-snakesize/2){
				xpos = xpos+snakesize;
			}
			else println("DEAD");
		}
		
	}

	// CHANGE DIRECTIONS

	void moveUp() {
		direction = "up";
	}

	void moveDown() {
		direction = "down";
	}

	void moveLeft() {
		direction = "left";
	}

	void moveRight() {
		direction = "right";
	}

	void draw(){
		rectMode(CENTER);
		fill(snakecolor);
		noStroke();
		rect(xpos,ypos,snakesize,snakesize);

	}
}
