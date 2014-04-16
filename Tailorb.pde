class TailOrb{
	
	TailOrb next;
	TailOrb previous; // this will be a doubly-linked lists

	int xpos;
	int ypos;
	String direction;
	int segmentsize;
	color segmentcolor; //color is a "data type" in Processing

	TailOrb(int initialx, int initialy, color initialcolor, int intitialsize, String initialdirection){ //CONSTRUCTOR
		xpos=initialx;//initial location
		ypos=initialy;
		segmentcolor = initialcolor;
		segmentsize = intitialsize;
		direction = initialdirection;
		next = null;
		previous = null;
	}

	// ACTUAL MOVEMENT
	void move() {
		if (direction == "up") {
			if (ypos > 0 + segmentsize/2){ //0 MEANS THE TOP EDGE IN THIS CASE. checking if the center of the snake is near top line/edge of screen.
				ypos = ypos-segmentsize;
			}
			else println("DEAD");

		}
		if (direction == "down") {
			if (ypos < height-segmentsize/2){ 
				ypos = ypos+segmentsize;
			}
			else println("DEAD");
			
		}
		if (direction == "left") {
			if (xpos > 0+segmentsize/2){
				xpos = xpos-segmentsize;
			}
			else println("DEAD");
		}
		if (direction == "right") {
			if (xpos < width-segmentsize/2){
				xpos = xpos+segmentsize;
			}
			else println("DEAD");
		}

		if (previous != null){
			direction = previous.direction;
		}
		
	}

	void draw(){
		rectMode(CENTER);
		fill(segmentcolor);
		noStroke();
		rect(xpos,ypos,segmentsize,segmentsize);
	}

}