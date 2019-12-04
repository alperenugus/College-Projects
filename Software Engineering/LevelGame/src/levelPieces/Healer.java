package levelPieces;

import gameEngine.Drawable;
import gameEngine.InteractionResult;

//Interactive Piece that interacts if it is at the same place with the player
public class Healer extends GamePiece {

	public Healer(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if(this.getLocation() == playerLocation) {
			return InteractionResult.GET_POINT;
		}
		return InteractionResult.NONE;
	}

}
