 class Pointcube{

	color cubecolor;
	int gridx;
	int gridy;
	int cubesize;
	int pointvalue;
	boolean lengthening;

	Pointcube(int initialsize, int grid[][]){  // initialsize is the grid cell size


		cubesize = initialsize;
		float choice = random(1); //going to give us a decimal number between 0 and 1
		if(choice < 0.75){
			cubecolor = color(255,255,255);
			lengthening = true;
			pointvalue = 20;
		}
		else{
			cubecolor = color(240,0,0);
			lengthening = false;
			pointvalue = 100;
		}

		placecube();

	}

	void placecube(){
		
		gridx = int(random(grid.length)); //THE DOUBLE PARENTHESES CASTS THE FLOATS OF RANDOM INTO INTEGERS
		gridy = int(random(grid.length));

		for (int i = 0; i < gridSize; i++){  //THIS RUNS THROUGH THE GRID TO CHECK IF THINGS ARE THERE
			for (int j = 0; j < gridSize; j++){
				if (grid[i][j] < 1) {
					grid[i][j]= 1;
				} 
				else {
					placecube();
				}
			}		
		}	
			
	}

	void draw(){

		ellipseMode(CENTER);
		fill(cubecolor);
		noStroke();
		int xpos = gridx*cubesize + cubesize/2; // CONVERTS THESE FOR THE RECT MODE XPOS/YPOS TO FIND THE CENTER OF THE TAILORB
		int ypos = gridy*cubesize + cubesize/2;
		ellipse(xpos,ypos,cubesize,cubesize);
	}
}

