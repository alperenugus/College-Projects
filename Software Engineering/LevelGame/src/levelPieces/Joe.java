package levelPieces;

import java.util.Random;

import gameEngine.Drawable;
import gameEngine.InteractionResult;
import gameEngine.Moveable;

// Moveable piece that moves randomly if the next position is available
public class Joe extends GamePiece implements Moveable{

	public Joe(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void draw() {
		System.out.print('J');
		
	}

	@Override
	public void move(Drawable[] gameBoard, int playerLocation) {
		// Randomized Movement
		Random rand = new Random();
		int move = rand.nextInt(gameBoard.length );
		if(move % 2 == 0 && gameBoard[move] == null && move < gameBoard.length && move != playerLocation) { // Controls before movement
			gameBoard[getLocation()] = null;
			this.setLocation(move);
			gameBoard[move] = this;
		}
		// Bring it to the beginning
		else if(gameBoard[0] == null && playerLocation != 0){
			gameBoard[getLocation()] = null;
			gameBoard[0] = this;
			this.setLocation(0);
		}
		
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if(this.getLocation() == playerLocation) {
			return InteractionResult.HIT;
		}
		return InteractionResult.NONE;
	}

}
