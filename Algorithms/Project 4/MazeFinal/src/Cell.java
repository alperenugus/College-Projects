import java.util.LinkedList;

public class Cell {
	private int row;
	private int col;
	private char color;
	private char bfsColor;
	private char circular;
	private String direction;
	boolean reversed;
	private LinkedList<Cell> adj;
	private Cell parent;
	private boolean forward;

	public Cell() {
	};

	public Cell(int row, int col, char color, char bfsColor, char circular, String direction, boolean reversed) {
		super();
		this.row = row;
		this.col = col;
		this.color = color;
		this.bfsColor = bfsColor;
		this.circular = circular;
		this.direction = direction;
		this.reversed = reversed;
		this.adj = new LinkedList<Cell>();
		this.forward = true;
	}

	public void printAdj() {
		for (Cell cell : adj) {
			System.out.print(cell.getRow());
			System.out.print(" ");
			System.out.print(cell.getCol());
			System.out.print("   ");
		}
		System.out.println();
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

	public char getColor() {
		return color;
	}

	public void setColor(char color) {
		this.color = color;
	}

	public char getBfsColor() {
		return bfsColor;
	}

	public void setBfsColor(char bfsColor) {
		this.bfsColor = bfsColor;
	}

	public char getCircular() {
		return circular;
	}

	public void setCircular(char circular) {
		this.circular = circular;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public boolean isReversed() {
		return reversed;
	}

	public void setReversed(boolean reversed) {
		this.reversed = reversed;
	}

	public LinkedList<Cell> getAdj() {
		return adj;
	}

	public void setAdj(LinkedList<Cell> adj) {
		this.adj = adj;
	}

	public Cell getParent() {
		return parent;
	}

	public void setParent(Cell parent) {
		this.parent = parent;
	}

	public boolean isForward() {
		return forward;
	}

	public void setForward(boolean forward) {
		this.forward = forward;
	}

	@Override
	public String toString() {
		return "Cell [row=" + row + ", col=" + col + ", color=" + color + ", bfsColor=" + bfsColor + ", circular="
				+ circular + ", direction=" + direction + ", reversed=" + reversed + "]";
	}

}