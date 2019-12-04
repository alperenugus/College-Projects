import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Queue;
import java.util.Scanner;

public class Maze {

	public static void main(String[] args) {
		Graph graph;

		File file = new File("src/input.txt");
		Scanner scanner;

		// Read maze from the file
		try {
			scanner = new Scanner(file);
			int row = scanner.nextInt();
			int col = scanner.nextInt();

			// Initialize graph object
			graph = new Graph(row, col);

			// Read all the maze cells from the file
			while (scanner.hasNext()) {
				row = scanner.nextInt();
				col = scanner.nextInt();
				char color = scanner.next().charAt(0);
				char circular = scanner.next().charAt(0);
				String direction = scanner.next();
				// Create 2 cells using the values from the file
				Cell newCell1 = new Cell(row, col, color, 'W', circular, direction, false);
				Cell newCell2 = null;

				// Create the second node for each cell in order to have the reversed ordered
				// nodes
				if (direction.equals("E"))
					newCell2 = new Cell(row, col, color, 'W', circular, "W", true);
				else if (direction.equals("W"))
					newCell2 = new Cell(row, col, color, 'W', circular, "E", true);
				else if (direction.equals("N"))
					newCell2 = new Cell(row, col, color, 'W', circular, "S", true);
				else if (direction.equals("S"))
					newCell2 = new Cell(row, col, color, 'W', circular, "N", true);
				else if (direction.equals("NE"))
					newCell2 = new Cell(row, col, color, 'W', circular, "SW", true);
				else if (direction.equals("SW"))
					newCell2 = new Cell(row, col, color, 'W', circular, "NE", true);
				else if (direction.equals("NW"))
					newCell2 = new Cell(row, col, color, 'W', circular, "SE", true);
				else if (direction.equals("SE"))
					newCell2 = new Cell(row, col, color, 'W', circular, "NW", true);
				else
					newCell2 = new Cell(row, col, color, 'W', circular, direction, false);

				// Add cells to the graph
				graph.addCell(newCell1);
				graph.addCell(newCell2);
			}

			scanner.close();

			// Calculate adjacency nodes for each node
			graph.fillAdj();

			// graph.printAdj();

			// BFS ALGORITHM

			Queue<Cell> queue = new LinkedList<>();
			// Add the starting node to the queue
			queue.add(graph.getCell(1, 1, "E"));
			if (graph.getCell(1, 1, "E").getCircular() == 'C')
				graph.getCell(1, 1, "E").setForward(false);

			while (!queue.isEmpty()) {
				Cell u = queue.peek();

				for (Cell cell : u.getAdj()) {
					if (cell.getBfsColor() == 'W' || cell.getColor() == 'X') {
						// Direction forward, upcoming cell not circular, not reversed
						if (u.isForward() && cell.getCircular() == 'N' && !cell.isReversed()) {
							cell.setBfsColor('G');
							cell.setParent(u);
							queue.add(cell);
							cell.setForward(u.isForward());
						}
						// Direction forward, upcoming cell circular, reversed
						if (u.isForward() && cell.getCircular() == 'C' && cell.isReversed()) {
							cell.setBfsColor('G');
							cell.setParent(u);
							cell.setForward(!u.isForward());
							queue.add(cell);
						}
						// Direction reversed, upcoming cell not circular, reversed
						if (!u.isForward() && cell.getCircular() == 'N' && cell.isReversed()) {
							cell.setBfsColor('G');
							cell.setParent(u);
							queue.add(cell);
							cell.setForward(u.isForward());
						}
						// Direction reversed, upcoming circular, not reversed
						if (!u.isForward() && cell.getCircular() == 'C' && !cell.isReversed()) {
							cell.setBfsColor('G');
							cell.setParent(u);
							queue.add(cell);
							cell.setForward(!u.isForward());
						}
						// Final Cell
						if (cell.getDirection().equals("X")) {
							cell.setBfsColor('G');
							cell.setParent(u);
							queue.add(cell);
						}

					}
				}

//				PRINT QUEUE
//				System.out.print(queue.peek().getRow());
//				System.out.print(" ");
//				System.out.print(queue.peek().getCol());
//				System.out.print(" ");
//				System.out.print(queue.peek().getDirection());
//				System.out.print(" ");
//				System.out.println(queue.peek().isForward());

				// Remove the processed cell from the queue
				queue.remove();
				u.setBfsColor('B');
			}

			Cell cell = graph.getCell(row, col, "X");
			if (cell.getParent() == null) {
				System.out.println("No path found!");
			}

			LinkedList<Cell> reverseResult = new LinkedList<Cell>();
			LinkedList<Cell> result = new LinkedList<Cell>();

			// Traceback using parents
			while (cell.getParent() != null) {
				reverseResult.add(cell);
				// System.out.println(cell.toString());
				cell = cell.getParent();

				if (cell.getParent() == null) {
					// System.out.println(cell.toString());
					reverseResult.add(cell);
				}
			}

			// Reverse the linked list so that we can have the ordered path
			ListIterator listIterator = reverseResult.listIterator(reverseResult.size());
			while (listIterator.hasPrevious()) {
//			    System.out.println(listIterator.previous());
				result.add((Cell) listIterator.previous());
			}

			// PRINT THE RESULTING PATH
			for (Cell i : result) {
				System.out.print("(" + i.getRow() + "," + i.getCol() + ") ");
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
