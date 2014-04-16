class Snake{

	TailOrb head;
	TailOrb tailtip;
	int snakelength;
	color snakecolor;
	int segmentsize;

	Snake(int initialx, int initialy, color initialcolor, int initialsize, String initialdirection){ //CONSTRUCTOR

		snakecolor = initialcolor;
		segmentsize = initialsize;
		head = new TailOrb(initialx, initialy, snakecolor, segmentsize, initialdirection); // adds the head to the snake
		tailtip = head;

		snakelength = 1;

		addregular();
		addregular();
	
	}

	void add(TailOrb new_tailorb_segment){

		// attach the new node to the edn of the list
		new_tailorb_segment.previous = tailtip;
		tailtip.next = new_tailorb_segment;
		tailtip = tailtip.next; //THE ORDER HERE IS RATHER IMPORTANT FOR THE ABOVE THREE LINES.
		snakelength++;


	}
	void addregular(){
		int newx = 0;
		int newy = 0;

		if(tailtip.direction == "up"){
			newx = tailtip.xpos;
			newy = tailtip.ypos + segmentsize;

		}

		else if (tailtip.direction == "down"){
			newx = tailtip.xpos;
			newy = tailtip.ypos - segmentsize;

		}

		else if (tailtip.direction == "left"){
			newx = tailtip.xpos + segmentsize;
			newy = tailtip.ypos;

		}

		else if (tailtip.direction == "right"){
			newx = tailtip.xpos - segmentsize;
			newy = tailtip.ypos;

		}


		TailOrb regular = new TailOrb(newx, newy, color(snakecolor, 170), segmentsize, tailtip.direction);

		regular.previous = tailtip;
		tailtip.next = regular;
		tailtip = tailtip.next; //THE ORDER HERE IS RATHER IMPORTANT FOR THE ABOVE THREE LINES.

		snakelength++; //MONITORS SNAKELENGTH FOR THE SCORE
	}
	// CHANGE DIRECTIONS
	void moveUp() {
		head.direction = "up";
	
	}

	void moveDown() {
		head.direction = "down";
	
	}

	void moveLeft() {
		head.direction = "left";
	
	}

	void moveRight() {
		head.direction = "right";
	
	}



	void move(){
		TailOrb t = head; 
		while(t != null) {
			// do things to move this particular tailorb
			t.move();
			t = t.next;
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
