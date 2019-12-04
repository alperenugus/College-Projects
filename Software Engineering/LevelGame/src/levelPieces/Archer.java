package levelPieces;

import gameEngine.Drawable;
import gameEngine.InteractionResult;

// Interactive Piece that interacts at different distances
public class Archer extends GamePiece{
	
	private static int ARCHER_HIT_DIST = 2;
	private static int ARCHER_KILL_DIST = 1;

	public Archer(char symbol, int location) {
		super(symbol, location);
		// TODO Auto-generated constructor stub
	}

	@Override
	public InteractionResult interact(Drawable[] pieces, int playerLocation) {
		if(this.getLocation() == Math.abs(playerLocation - ARCHER_HIT_DIST)) {
			return InteractionResult.HIT;
		}
		else if(this.getLocation() == Math.abs(playerLocation - ARCHER_KILL_DIST)) {
			return InteractionResult.KILL;
		}
		
		return InteractionResult.NONE;
	}

}
