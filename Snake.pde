class Snake{

	color snakecolor;
	int segmentsize;
	ArrayList<TailOrb> snake;

	Snake(int initialx, int initialy, color initialcolor, int initialsize, String initialdirection){ //CONSTRUCTOR
		snakecolor = initialcolor;
		segmentsize = initialsize;
		snake = new ArrayList<TailOrb>();

		snake.add(new TailOrb(initialx, initialy, snakecolor, segmentsize, initialdirection)); // adds the head to the snake
		addregular();
		addregular();
		addregular();
		addregular();
	}

	void add(TailOrb new_tailorb_segment){
		snake.add(new_tailorb_segment);
	}

	void addregular(){
		int newx = 0;
		int newy = 0;
		TailOrb tip = snake.get(snake.size()-1);
		String tipDir = tip.direction;
		if(tipDir == "up"){
			newx = tip.xpos;
			newy = tip.ypos + segmentsize;
		} else if (tipDir == "down"){
			newx = tip.xpos;
			newy = tip.ypos - segmentsize;
		} else if (tipDir == "left"){
			newx = tip.xpos + segmentsize;
			newy = tip.ypos;
		} else if (tipDir == "right"){
			newx = tip.xpos - segmentsize;
			newy = tip.ypos;
		}

		TailOrb regular = new TailOrb(newx, newy, color(snakecolor, 170), segmentsize, tipDir);
		snake.add(regular);
	}

	// CHANGE DIRECTIONS
	void moveUp() {
		TailOrb head = snake.get(0);
		head.updateDirection("up");
		snake.set(0, head);
	}

	void moveDown() {
		TailOrb head = snake.get(0);
		head.updateDirection("down");
		snake.set(0, head);	
	}

	void moveLeft() {
		TailOrb head = snake.get(0);
		head.updateDirection("left");
		snake.set(0, head);
	}

	void moveRight() {
		TailOrb head = snake.get(0);
		head.updateDirection("right");
		snake.set(0, head);
	}

	void move(){
		for(int i = 0; i < snake.size(); i++) {
			TailOrb t = snake.get(i);
			t.move();
			snake.set(i, t);
		}
		updateDirections();
	}

	void updateDirections() {
		for(int i = snake.size()-1; i > 0; i--) {
			TailOrb t = snake.get(i);
			TailOrb p = snake.get(i-1);
			t.updateDirection(p.getDirection());
			snake.set(i, t);
		}
	}

	void draw(){
		for(int i = 0; i < snake.size(); i++) {
			TailOrb t = snake.get(i);
			t.draw();
		}
	}

}
