package levelPieces;

import java.util.ArrayList;
import java.util.Random;

import gameEngine.Drawable;
import gameEngine.Moveable;

public class LevelEngine {
	
	public static int BOARD_SIZE = 20;
	private Random rand = new Random();
	
	// Needed data structures
	private Drawable[] board;
	private ArrayList<Moveable> movingPieces;
	private ArrayList<GamePiece> interactingPieces;
	private int playerStartLoc;
	
	// Constructor creates the objects, sets the player's location.
	public LevelEngine(){
		board = new Drawable[BOARD_SIZE];
		movingPieces = new ArrayList<Moveable>();
		interactingPieces = new ArrayList<GamePiece>();
		int rand_int = rand.nextInt(19); 
		playerStartLoc = rand_int;
	}


	public void createLevel(int levelNum) {
        if (levelNum == 1) {
            this.firstLevel();
        }
        if (levelNum == 2) {
            this.secondLevel();
        }
		
	}

	public Drawable[] getBoard() {
		return board;
	}

	public ArrayList<Moveable> getMovingPieces() {
		return movingPieces;
	}

	public ArrayList<GamePiece> getInteractingPieces() {
		return interactingPieces;
	}

	public int getPlayerStartLoc() {
		return playerStartLoc;
	}
	
	// Creating the first level
	private void firstLevel() {
		
		// Static pieces that do not move
		Archer archer = new Archer('A', 12);
		this.interactingPieces.add(archer);
		this.board[archer.getLocation()] = archer;
		
		Commander commander = new Commander('C', 1);
		this.interactingPieces.add(commander);
		this.board[commander.getLocation()] = commander;
		
		
		Mage mage = new Mage('M' , 17);
		this.interactingPieces.add(mage);
		this.board[mage.getLocation()] = mage;
		
		Healer healer = new Healer('H', 5);
		this.interactingPieces.add(healer);
		this.board[healer.getLocation()] = healer;
		
		Warrior warrior = new Warrior('W' , 9);
		this.interactingPieces.add(warrior);
		this.board[warrior.getLocation()] = warrior;
		
		
		// Moveable pieces that moves according to their algorithm
		Joe joe = new Joe('J' , 2);
		this.movingPieces.add(joe);
		this.board[joe.getLocation()] = joe;
		
		Redkit redkit = new Redkit('R' , 3);
		this.movingPieces.add(redkit);
		this.board[redkit.getLocation()] = redkit;
		
	}
	
	private void secondLevel() {
		// Static pieces that do not move
		Archer archer = new Archer('A', 2);
		this.interactingPieces.add(archer);
		this.board[archer.getLocation()] = archer;
		
		Commander commander = new Commander('C', 10);
		this.interactingPieces.add(commander);
		this.board[commander.getLocation()] = commander;
		
		Mage mage = new Mage('M' , 6);
		this.interactingPieces.add(mage);
		this.board[mage.getLocation()] = mage;
		
		Healer healer = new Healer('H', 17);
		this.interactingPieces.add(healer);
		this.board[healer.getLocation()] = healer;
		
		Warrior warrior = new Warrior('W' , 16);
		this.interactingPieces.add(warrior);
		this.board[warrior.getLocation()] = warrior;
		
		
		// Moveable pieces that moves according to their algorithm
		Joe joe = new Joe('J' , 4);
		this.movingPieces.add(joe);
		this.board[joe.getLocation()] = joe;
		
		Redkit redkit = new Redkit('R' , 11);
		this.movingPieces.add(redkit);
		this.board[redkit.getLocation()] = redkit;
	}

}
