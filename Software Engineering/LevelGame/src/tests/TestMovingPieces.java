package tests;

import static org.junit.Assert.fail;

import org.junit.Test;

import gameEngine.Drawable;
import gameEngine.GameEngine;
import levelPieces.Healer;
import levelPieces.Joe;
import levelPieces.Redkit;

public class TestMovingPieces {
	@Test
	public void testJoe() {
		// Joe is a randomly moving object
		
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];
		// Put some static drawables to the gameBoard in order to test if Joe overlaps with them
		for (int i=1;i<=5; i++)
			gameBoard[i] = new Healer('H', i);
		
		for (int i=7; i<=11; i++)
			gameBoard[i] = new Healer('H', i);
		
		for (int i=14; i<20; i++)
			gameBoard[i] = new Healer('H', i);
		
		Joe joe = new Joe('J', 6);
		gameBoard[6] = joe;
		
		// Counters that count when Joe gets into a certain location
		int count0 = 0;
		int count6 = 0;
		int count12 = 0;
		int count20 = 0;
		
		//Assuiming player is in location 13, loop through 200 times to test random movement
		for (int i=0; i<200; i++) {
			joe.move(gameBoard, 13);
			int loc = joe.getLocation();
			if (loc != 0 && loc != 6 && loc != 12 && loc != 20)
				fail("Invalid square selected");
			// counters to ensure every valid option is chosen
						if (loc == 0) count0++;
						if (loc == 6) count6++;
						if (loc == 12) count12++;
						if (loc == 20) count20++;
		}
		
		// Ensure each option is randomly chosen some number of times. 
				assert(count0 > 1);
				assert(count6 > 1);
				assert(count12 > 1);
				assert(count20 > 1);
	}
	
	@Test
	public void testRedkit() {
		// Redkit is a moveable that tries to go to the direction right if available and if not, steps 1 to the left
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];
		
		// Static game piece to the beginning
		gameBoard[0] = new Healer('H', 5);
		
		Redkit redkit = new Redkit('R', 1);
		gameBoard[1] = redkit;
		
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		int count6 = 0;
		int count7 = 0;
		int count8 = 0;
		int count9 = 0;
		
		
		//Assuiming player is in location 13
		// Loop 200 times to see if Redkit gets to the right
		for (int i=0; i<200; i++) {
			redkit.move(gameBoard, 10);
			int loc = redkit.getLocation();
			if (loc != 2 && loc != 3 && loc != 4 && loc != 5 && loc != 6 && loc != 7 && loc != 8 && loc != 9)
				fail("Invalid square selected");
			// counters to ensure every valid option is chosen
						if (loc == 2) count2++;
						if (loc == 3) count3++;
						if (loc == 4) count4++;
						if (loc == 5) count5++;
						if (loc == 6) count6++;
						if (loc == 7) count7++;
						if (loc == 8) count8++;
						if (loc == 9) count9++;

		}
		
		// Ensure each option is randomly chosen some number of times. 
				assert(count2 > 0);
				assert(count3 > 0);
				assert(count4 > 0);
				assert(count5 > 0);
				assert(count6 > 0);
				assert(count7 > 0);
				assert(count8 > 0);
				assert(count9 > 192);
				
	}
	
}
