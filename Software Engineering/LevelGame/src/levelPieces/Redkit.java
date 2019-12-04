package levelPieces;

import gameEngine.Drawable;
import gameEngine.InteractionResult;
import gameEngine.Moveable;

//Moveable piece that moves according to our algorithm

public class Redkit extends GamePiece implements Moveable {

	public Redkit(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void draw() {
		System.out.print('R');
		
	}

	@Override
	public void move(Drawable[] gameBoard, int playerLocation) {
		int right = getLocation() + 1;
		int left = getLocation() - 1;
		if(right < gameBoard.length && gameBoard[right] == null && playerLocation != right) {
			gameBoard[getLocation()] = null;
			gameBoard[right] = this;
			setLocation(right);
		}
		else if(left > gameBoard.length && gameBoard[left] == null && playerLocation != left){
			gameBoard[getLocation()] = null;
			gameBoard[left] = this;
			setLocation(left);
		}
		
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if(this.getLocation() == playerLocation) {
			return InteractionResult.GET_POINT;
		}
		return InteractionResult.NONE;
	}

}
