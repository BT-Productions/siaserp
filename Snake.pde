class Snake{

	TailOrb head;
	TailOrb tailtip;
	int snakelength;
	color snakecolor;
	int segmentsize;

	Snake(int initialx, int initialy, color initialcolor, int initialsize, String initialdirection, int grid[][]){ //CONSTRUCTOR

		snakecolor = initialcolor;
		segmentsize = initialsize;
		head = new TailOrb(initialx, initialy, snakecolor, segmentsize, initialdirection, grid); // adds the head to the snake
		tailtip = head;

		snakelength = 1;

		addregular(grid);
		addregular(grid);
		addregular(grid);
		addregular(grid);
	
	}

	void addregular(int grid[][]){

		int newx = 0;
		int newy = 0;

		if(tailtip.direction == "up"){
			newx = tailtip.gridx;
			newy = tailtip.gridy + segmentsize;
		} else if (tailtip.direction == "down"){
			newx = tailtip.gridx;
			newy = tailtip.gridy - segmentsize;
		} else if (tailtip.direction == "left"){
			newx = tailtip.gridx + segmentsize;
			newy = tailtip.gridy;
		} else if (tailtip.direction == "right"){
			newx = tailtip.gridx - segmentsize;
			newy = tailtip.gridy;
		}

		TailOrb regular = new TailOrb(newx, newy, color(snakecolor, 170), segmentsize, tailtip.direction, grid);

		regular.previous = tailtip;
		tailtip.next = regular;
		tailtip = tailtip.next; //THE ORDER HERE IS RATHER IMPORTANT FOR THE ABOVE THREE LINES.

		snakelength++; //MONITORS SNAKELENGTH FOR THE SCORE

	}
	
    void moveInput(char dir) {

        switch(dir) {
        	case 'u' :
        	    if (head.next.direction != "down") head.direction = "up"; //IF THE THInG IN THE PARENTHESES IS TRUE. DO THE THING OUTSIDE THE PARENTHETHESES.
        		break;
        	case 'd' :
        		if (head.next.direction != "up") head.direction = "down";
        		break;
        	case 'l' :
        		if (head.next.direction != "right") head.direction = "left";
        	    break;
        	case 'r' :
        		if (head.next.direction != "left") head.direction = "right";
       		    break;
        }

    }

	void move(int grid[][]){

		TailOrb t = tailtip;

		while(t != null) {
			// do things to move this particular tailorb
			t.move(grid);
			t = t.previous;
		}

	}
	
	void draw(){

		TailOrb t = head; // STARTING OUT.

		while(t != null) { // LOOKIN AT IT, IS THERE SOMEONE NEW?! (IS THERE SOMETHING THERE?)
			t.draw(); // DRAWING IT
			t = t.next; // NOW MOVING ON
		}

	}

}
