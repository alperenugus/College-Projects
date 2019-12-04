import java.util.LinkedList;

public class Graph {

	private int row;
	private int col;

	private LinkedList<Cell> cells;

	public Graph(int row, int col) {
		super();
		this.row = row;
		this.col = col;
		cells = new LinkedList<Cell>();
	}

	public void addCell(Cell cell) {
		cells.add(cell);
	}

	public Cell getCell(int row, int col, String direction) {
		for (Cell cell : cells) {
			if (cell.getRow() == row && cell.getCol() == col && cell.getDirection().equals(direction))
				return cell;
		}

		return null;
	}

	public void printGraph() {
		for (Cell cell : cells) {
			System.out.println(cell.toString());
		}
	}

	public void printAdj() {
		for (Cell cell : cells) {
			System.out.print(cell.getRow());
			System.out.print(" ");
			System.out.print(cell.getCol());
			System.out.print(" ");
			System.out.print(cell.getDirection());
			System.out.print(" :");
			cell.printAdj();
		}

	}

	public void fillAdj() {
		for (Cell cell : cells) {

			for (Cell subcell : cells) {
				// If the row and column values and colors are not the same
				if (!(cell.getRow() == subcell.getRow() && cell.getCol() == subcell.getCol())
						&& cell.getColor() != subcell.getColor()) {

					// Fill adjacencies according to directions

					if (cell.getDirection().equals("E") && subcell.getCol() > cell.getCol()
							&& subcell.getRow() == cell.getRow()) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("W") && subcell.getCol() < cell.getCol()
							&& subcell.getRow() == cell.getRow()) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("N") && subcell.getRow() < cell.getRow()
							&& subcell.getCol() == cell.getCol()) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("S") && subcell.getRow() > cell.getRow()
							&& subcell.getCol() == cell.getCol()) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("NE") && subcell.getRow() < cell.getRow()
							&& subcell.getCol() > cell.getCol() && (Math.abs(subcell.getCol() - cell.getCol()) == Math
									.abs(subcell.getRow() - cell.getRow()))) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("NW") && subcell.getRow() < cell.getRow()
							&& subcell.getCol() < cell.getCol() && (Math.abs(subcell.getCol() - cell.getCol()) == Math
									.abs(subcell.getRow() - cell.getRow()))) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("SE") && subcell.getRow() > cell.getRow()
							&& subcell.getCol() > cell.getCol() && (Math.abs(subcell.getCol() - cell.getCol()) == Math
									.abs(subcell.getRow() - cell.getRow()))) {
						cell.getAdj().add(subcell);
					}

					if (cell.getDirection().equals("SW") && subcell.getRow() > cell.getRow()
							&& subcell.getCol() < cell.getCol() && (Math.abs(subcell.getCol() - cell.getCol()) == Math
									.abs(subcell.getRow() - cell.getRow()))) {
						cell.getAdj().add(subcell);
					}
				}

			}

		}

	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public LinkedList<Cell> getCells() {
		return cells;
	}

	public void setCells(LinkedList<Cell> cells) {
		this.cells = cells;
	}

}
