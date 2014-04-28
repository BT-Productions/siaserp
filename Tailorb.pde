class TailOrb{
	
	TailOrb next;
	TailOrb previous; // this will be a doubly-linked lists

	int xpos;
	int ypos;

	int gridx;
	int gridy;

	String direction;

	int segmentsize;
	color segmentcolor; //color is a "data type" in Processing

	TailOrb(int initialx, int initialy, color initialcolor, int intitialsize, String initialdirection, int grid[][]){ //CONSTRUCTOR

		xpos=initialx;//initial location
		ypos=initialy;

		segmentsize = intitialsize;
		gridx=initialx/segmentsize;
		gridy=initialy/segmentsize;

		grid[gridx][gridy]=grid[gridx][gridy]+1; //TAILORB NOW OCCUPYING THIS SQUARE

		segmentcolor = initialcolor;
		
		direction = initialdirection;
		next = null;
		previous = null;

	}

	// ACTUAL MOVEMENT
	void move(int grid[][]) {

		grid[gridx][gridy]=grid[gridx][gridy]-1; //WE LEFT THE SQUARE WE'RE IN

		if (direction == "up") {
			if (ypos > 0 + segmentsize/2){ //0 MEANS THE TOP EDGE IN THIS CASE. checking if the center of the snake is near top line/edge of screen.
				ypos = ypos-segmentsize;
				gridy=gridy-1;
			} else println("DEAD");
		} else if (direction == "down") {
			if (ypos < height-segmentsize/2){ 
				ypos = ypos+segmentsize;
				gridy=gridy+1;
			} else println("DEAD");
		} else if (direction == "left") {
			if (xpos > 0+segmentsize/2){
				xpos = xpos-segmentsize;
				gridx=gridx-1;
			} else println("DEAD");
		} else if (direction == "right") {
			if (xpos < width-segmentsize/2){
				xpos = xpos+segmentsize;
				gridx=gridx+1;
			} else println("DEAD");
		}

		grid[gridx][gridy]=grid[gridx][gridy]+1; // WE'VE ENTERED THE NEW SQUARE!

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
