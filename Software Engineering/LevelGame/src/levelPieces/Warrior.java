package levelPieces;

import gameEngine.Drawable;
import gameEngine.InteractionResult;

public class Warrior extends GamePiece {

	public Warrior(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if (Math.abs(this.getLocation() - playerLocation) < 2) {
            return InteractionResult.HIT;
        }
		return InteractionResult.NONE;
	}

}
