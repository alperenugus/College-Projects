package tests;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import gameEngine.Drawable;
import gameEngine.GameEngine;
import gameEngine.InteractionResult;
import levelPieces.Archer;
import levelPieces.Commander;
import levelPieces.Healer;
import levelPieces.Mage;
import levelPieces.Warrior;

public class TestInteractions {
	
	@Test
	public void testArcher() {
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];
		
		Archer archer = new Archer('A', 10);
		
		//Checking the non-effective places
		for (int i=0; i<8; i++)
			assertEquals(InteractionResult.NONE, archer.interact(gameBoard, i));
		
		for (int i=13; i<20; i++)
			assertEquals(InteractionResult.NONE, archer.interact(gameBoard, i));
		
		// Testing the interactions
		assertEquals(InteractionResult.HIT, archer.interact(gameBoard, 12));
		assertEquals(InteractionResult.KILL, archer.interact(gameBoard, 11));
	}

	@Test
	public void testCommander() {
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];
		
		Commander commander = new Commander('C', 10);
		gameBoard[10] = commander;
		
		// Kills if player on same space
		assertEquals(InteractionResult.KILL, commander.interact(gameBoard, 10));
		// These loops ensure no interaction if not on same space
		for (int i=0; i<10; i++)
			assertEquals(InteractionResult.NONE, commander.interact(gameBoard, i));
		for (int i=11; i<GameEngine.BOARD_SIZE; i++)	
			assertEquals(InteractionResult.NONE, commander.interact(gameBoard, i));
	}	
	
	@Test
	public void testHealer() {
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];
		
		Healer healer = new Healer('H', 10);
		gameBoard[10] = healer;
		
		// Kills if player on same space
		assertEquals(InteractionResult.GET_POINT, healer.interact(gameBoard, 10));
		// These loops ensure no interaction if not on same space
		for (int i=0; i<10; i++)
			assertEquals(InteractionResult.NONE, healer.interact(gameBoard, i));
		for (int i=11; i<GameEngine.BOARD_SIZE; i++)	
			assertEquals(InteractionResult.NONE, healer.interact(gameBoard, i));
			
	}
	
	@Test
	public void testMage() {
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];

		Mage mage = new Mage('H', 10);
		gameBoard[10] = mage;
		
		// Checking the non-effective places
		for (int i=0; i<8; i++)
			assertEquals(InteractionResult.NONE, mage.interact(gameBoard, i));
		
		for (int i=13; i<20; i++)
			assertEquals(InteractionResult.NONE, mage.interact(gameBoard, i));
		
		// Testing the interactions
		assertEquals(InteractionResult.GET_POINT, mage.interact(gameBoard, 12));
		assertEquals(InteractionResult.ADVANCE, mage.interact(gameBoard, 11));
		assertEquals(InteractionResult.ADVANCE, mage.interact(gameBoard, 10));
		assertEquals(InteractionResult.ADVANCE, mage.interact(gameBoard, 9));
		assertEquals(InteractionResult.GET_POINT, mage.interact(gameBoard, 8));
	}
	
	@Test
	public void testWarrior() {
		Drawable [] gameBoard = new Drawable[GameEngine.BOARD_SIZE];

		Warrior warrior = new Warrior('W', 10);
		gameBoard[10] = warrior;
		
		// Hits if player on same space
		assertEquals(InteractionResult.HIT, warrior.interact(gameBoard, 10));
		// These loops ensure no interaction if not on same space
		for (int i=0; i<8; i++)
			assertEquals(InteractionResult.NONE, warrior.interact(gameBoard, i));
		for (int i=12; i<GameEngine.BOARD_SIZE; i++)	
			assertEquals(InteractionResult.NONE, warrior.interact(gameBoard, i));
		
		assertEquals(InteractionResult.HIT, warrior.interact(gameBoard, 9));
		assertEquals(InteractionResult.HIT, warrior.interact(gameBoard, 11));
	}
}
