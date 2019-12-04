package levelPieces;

import gameEngine.Drawable;
import gameEngine.InteractionResult;

//Interactive Piece that interacts at different distances

public class Mage extends GamePiece{

	public Mage(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if (Math.abs(this.getLocation() - playerLocation) == 2) {
            return InteractionResult.GET_POINT;
        }
		else if (Math.abs(this.getLocation() - playerLocation) < 2) {
            return InteractionResult.ADVANCE;
        }
		return InteractionResult.NONE;
	}

}
