Snake snake1; //DECLARING
Snake snake2;

// be sensible: 
int tileSize = 20; // the pixel size of tiles
int gridSize = 41; // how many tiles on each axis of the grid

int grid[][];

int mil = millis(); // raw elapsed time
int display_millis = mil % 1000; // cut out anything greater than 1 second... the remainder are displayed milliseconds
int sec = mil / 1000;				// convert raw elapsed time to seconds, getting rid of any remainder
int display_seconds = sec % 60;	// cut out anything greater than 1 minute... the remainder are displayed milliseconds
int mins = sec / 60;
int display_minutes = mins % 60;
int hours = mins / 60;
int display_hours = hours;
String elapsedTime = display_hours + ":" + display_minutes + ":" + display_seconds + "." + display_millis;

String score = "";

void setup(){

	size(gridSize*tileSize,gridSize*tileSize);
	grid = new int [gridSize][gridSize];

	for (int i = 0; i < gridSize; i++){
		for (int j = 0; j < gridSize; j++){
			grid[i][j] = 0;
		}
	}

	int s1xpos = ((tileSize * (gridSize - gridSize % 4)/4) - tileSize/2);
	int s1ypos = ((height/2 - (height/2)%tileSize) + tileSize/2);

	int s2xpos = ((tileSize * 3 * (gridSize - gridSize % 4)/4) + tileSize/2);
	int s2ypos = ((height/2 + (height/2)%tileSize) - tileSize/2);

	snake1 = new Snake(s1xpos, s1ypos, color(0,0,200), tileSize, "right", grid); //INITIALIZING 
	snake2 = new Snake(s2xpos, s2ypos, color(0,200,0), tileSize, "left", grid);

	frameRate(60);

}

void draw(){

	background(20);

	if (frameCount%60 == 0){ //every 60 frames, do this:
		snake1.move(grid);
		snake2.move(grid);
	}

	snake1.draw();
	snake2.draw();

	mil = millis(); // raw elapsed time
  	display_millis = mil % 1000; // cut out anything greater than 1 second... the remainder are displayed milliseconds
    sec = mil / 1000;				// convert raw elapsed time to seconds, getting rid of any remainder
    display_seconds = sec % 60;	// cut out anything greater than 1 minute... the remainder are displayed milliseconds
    mins = sec / 60;
    display_minutes = mins % 60;
    hours = mins / 60;
    display_hours = hours;
	elapsedTime = display_hours + ":" + display_minutes + ":" + display_seconds + "." + display_millis;

    textSize(12);
    fill(255);
    textAlign(CENTER);
    text(elapsedTime, width/2, height/4);

    score = "" + sec/2; // <-- THIS converts ints to strings. Showing a point every two seconds (.5 of a point every second).

    text(score, width/2, height/4-12);

    for (int i = 0; i < gridSize; i++){
		for (int j = 0; j < gridSize; j++){
			if (grid[i][j] > 1) println("SUPERDEAD");

		}
	}

}

void keyPressed(){

	//snake 2
	if (key==CODED){
		switch(keyCode) {
			case UP :
				snake2.moveInput('u');
				break;
			case DOWN :
				snake2.moveInput('d');
				break;
			case LEFT :
				snake2.moveInput('l');
				break;
			case RIGHT :
				snake2.moveInput('r');
				break;
			default :
				break;
		}
	} else {
		//snake 1
		switch(key) {
			case 'w' :
				snake1.moveInput('u');
				break;
			case 's' :
				snake1.moveInput('d');
				break;
			case 'a' :
				snake1.moveInput('l');
				break;
			case 'd' :
				snake1.moveInput('r');
				break;
			default:
				break;
		}
	}

}
