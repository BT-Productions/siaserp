class TailOrb{
	
	TailOrb next;
	TailOrb previous; // this will be a doubly-linked lists

	int gridx;
	int gridy;

	String direction;

	int segmentsize;
	color segmentcolor; //color is a "data type" in Processing

	TailOrb(int initialx, int initialy, color initialcolor, int intitialsize, String initialdirection, int grid[][]){ //CONSTRUCTOR

		gridx=initialx;//initial location
		gridy=initialy;

		segmentsize = intitialsize;

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
			if (gridy > 0){ //0 MEANS THE TOP EDGE IN THIS CASE. checking if the center of the snake is near top line/edge of screen.
				gridy=gridy-1;
			} else println("DEAD");

		} else if (direction == "down") {
			if (gridy < grid[0].length){ 
				gridy=gridy+1;
			} else println("DEAD");

		} else if (direction == "left") {
			if (gridx > 0){
				gridx=gridx-1;
			} else println("DEAD");

		} else if (direction == "right") {
			if (gridx < grid.length){
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
		int xpos = gridx*segmentsize + segmentsize/2; // CONVERTS THESE FOR THE RECT MODE XPOS/YPOS TO FIND THE CENTER OF THE TAILORB
		int ypos = gridy*segmentsize + segmentsize/2;
		rect(xpos,ypos,segmentsize,segmentsize);

	}

}
