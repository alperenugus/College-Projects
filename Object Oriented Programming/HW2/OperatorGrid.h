#pragma once
#include "ArithmeticOperator.h"

#define MAX_OPERATOR_SIZE 1000

class OperatorGrid {
	int grid_rows;
	int grid_cols;
	char** grid;
	int num_operators;
	ArithmeticOperator* operators[MAX_OPERATOR_SIZE];

public:
	OperatorGrid(int rows, int cols);
	~OperatorGrid();
	bool place_operator(ArithmeticOperator*);
	bool move_operator(int x, int y, char direction, int move_by);
	void print_operators();
	int ctrl_border(int x_pos, int y_pos, int size, char symbol);
	ArithmeticOperator find_center(int x_pos, int y_pos);
	void put_grid(int x_pos, int y_pos, int size, char symbol);
	void put_zero(int x_pos, int y_pos, int size, char symbol);
};

//Constructor
OperatorGrid::OperatorGrid(int rows, int cols) {
	num_operators = 0;
	grid_rows = rows;
	grid_cols = cols;
	grid = new char* [rows];
	for (int i = 0; i < rows; i++) {
		grid[i] = new char[cols];
	}

	//Assigning all the elements in the grid to 0
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < cols; ++j)
		{
			grid[i][j] = '0';
		}
	}
}


bool OperatorGrid::place_operator(ArithmeticOperator* in_op) {
	int ctrl;
	//A function that controls if there is a conflict or border violation
	ctrl = ctrl_border(in_op->get_x(), in_op->get_y(), in_op->get_size(), in_op->get_sign());

	if (ctrl == 1) {
		// SUCCESS
		cout << "SUCCESS: Operator " << in_op->get_sign() << " with size " << in_op->get_size() << " is placed on (" << in_op->get_x() + 1 << "," << in_op->get_y() + 1 << ")." << endl;

		put_grid(in_op->get_x(), in_op->get_y(), in_op->get_size(), in_op->get_sign());
		operators[num_operators] = new ArithmeticOperator(0, 0, 0, '?');
		operators[num_operators]->set_x(in_op->get_x());
		operators[num_operators]->set_y(in_op->get_y());
		operators[num_operators]->set_size(in_op->get_size());
		operators[num_operators]->set_sign(in_op->get_sign());
		num_operators++;

	}
	if (ctrl == 2) {
		// BORDER ERROR
		cout << "BORDER ERROR: Operator " << in_op->get_sign() << " with size " << in_op->get_size() << " can not be placed on (" << in_op->get_x() + 1 << "," << in_op->get_y() + 1 << ")." << endl;
		return false;
	}
	if (ctrl == 3) {
		// CONFLICT ERROR
		cout << "CONFLICT ERROR: Operator " << in_op->get_sign() << " with size " << in_op->get_size() << " can not be placed on (" << in_op->get_x() + 1 << "," << in_op->get_y() + 1 << ")." << endl;
		return false;
	}
	if (ctrl == 4) {
		// BOTH BORDER AND CONFLICT ERROR
		cout << "BORDER ERROR: Operator " << in_op->get_sign() << " with size " << in_op->get_size() << " can not be placed on (" << in_op->get_x() + 1 << "," << in_op->get_y() + 1 << ")." << endl;
		cout << "CONFLICT ERROR: Operator " << in_op->get_sign() << " with size " << in_op->get_size() << " can not be placed on (" << in_op->get_x() + 1 << "," << in_op->get_y() + 1 << ")." << endl;
		return false;
	}

	return true;
}

bool OperatorGrid::move_operator(int x, int y, char direction, int move_by) {
	//find_center returns the center of the operators that is to be moved
	ArithmeticOperator found_op = find_center(x, y);
	put_zero(found_op.get_x(), found_op.get_y(), found_op.get_size(), found_op.get_sign());
	int next_x_pos = found_op.get_x();
	int next_y_pos = found_op.get_y();

	//DEFINE NEW CENTER POINTS ACCORDING TO INSTRUCTIONS
	if (direction == 'U')  next_x_pos -= move_by;

	if (direction == 'D')  next_x_pos += move_by;

	if (direction == 'R')  next_y_pos += move_by;

	if (direction == 'L')  next_y_pos -= move_by;
	//Again control if there is any operator or border violation for the place to be moved
	int new_control = ctrl_border(next_x_pos, next_y_pos, found_op.get_size(), found_op.get_sign());


	if (new_control == 1) {
		cout << "SUCCESS: " << found_op.get_sign() << " moved from (" << found_op.get_x() + 1 << "," << found_op.get_y() + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
		int changed_center;
		for (int i = 0; i < num_operators; i++) {
			if (operators[i]->get_x() == found_op.get_x() && operators[i]->get_y() == found_op.get_y()) {
				changed_center = i;
			}
		}

		operators[changed_center]->reset(next_x_pos, next_y_pos, found_op.get_size());

		//Change the grid itself according to new positions
		put_grid(next_x_pos, next_y_pos, found_op.get_size(), found_op.get_sign());
	}
	if (new_control == 2) {
		// BORDER ERROR
		cout << "BORDER ERROR: " << found_op.get_sign() << " can not be moved from (" << found_op.get_x() + 1 << "," << found_op.get_y() + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
		put_grid(found_op.get_x(), found_op.get_y(), found_op.get_size(), found_op.get_sign());
	}
	if (new_control == 3) {
		// CONFLICT ERROR
		cout << "CONFLICT ERROR: " << found_op.get_sign() << " can not be moved from (" << found_op.get_x() + 1 << "," << found_op.get_y() + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
		put_grid(found_op.get_x(), found_op.get_y(), found_op.get_size(), found_op.get_sign());
	}
	if (new_control == 4) {
		// BOTH BORDER AND CONFLICT ERROR
		cout << "BORDER ERROR: " << found_op.get_sign() << " can not be moved from (" << found_op.get_x() + 1 << "," << found_op.get_y() + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
		cout << "CONFLICT ERROR: " << found_op.get_sign() << " can not be moved from (" << found_op.get_x() + 1 << "," << found_op.get_y() + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
		put_grid(found_op.get_x(), found_op.get_y(), found_op.get_size(), found_op.get_sign());
	}

	return true;
}

ArithmeticOperator OperatorGrid::find_center(int x_pos, int y_pos) {
	x_pos--;
	y_pos--;
	bool x_flag = false;
	bool y_flag = false;
	bool found = false;
	char symbol = grid[x_pos][y_pos];
	//Operator to be moved
	ArithmeticOperator to_be_moved(0, 0, 0, symbol);
	/*
	operators[k]->get_x();
	operators[k]->get_y();
	operators[k]->get_size();
	*/

	//Finding the center of the operator if it is a '+'
	if (symbol == '+') {
		for (int k = 0; k < num_operators; k++) {
			for (int i = operators[k]->get_x() - operators[k]->get_size(); i <= operators[k]->get_x() + operators[k]->get_size(); i++) {
				if (i == x_pos && !found) {
					x_flag = true;
					to_be_moved.set_x(operators[k]->get_x());
				}
				if (x_flag) {
					for (int j = operators[k]->get_y() - operators[k]->get_size(); j <= operators[k]->get_y() + operators[k]->get_size(); j++) {
						if (j == y_pos) y_flag = true;
						if (x_flag && y_flag && !found) {
							if (grid[operators[k]->get_x()][operators[k]->get_y()] == '+') {
								to_be_moved.set_y(operators[k]->get_y());
								found = true;
								to_be_moved.set_size(operators[k]->get_size());
							}
						}
					}
				}
			}
		}
		//cout << "Found your center: " << "x:" << to_be_moved.get_x() + 1 << " y:" << to_be_moved.get_y() + 1 << " size:" << to_be_moved.get_size()<< endl;
	}
	//Finding the center of the operator if it is a '-'
	if (symbol == '-') {
		to_be_moved.set_x(x_pos);
		for (int k = 0; k < num_operators; k++) {
			for (int i = operators[k]->get_y() - operators[k]->get_size(); i <= operators[k]->get_y() + operators[k]->get_size(); i++) {
				if (i == y_pos && operators[k]->get_x() == x_pos && !found) {
					if (grid[operators[k]->get_x()][operators[k]->get_y()] == '-') {
						to_be_moved.set_y(operators[k]->get_y());
						found = true;
						to_be_moved.set_size(operators[k]->get_size());
					}
				}
			}
		}
		//cout << "Found your center: " << "x:" << to_be_moved.get_x() + 1 << " y:" << to_be_moved.get_y() + 1 << " size:" << to_be_moved.get_size() << endl;
	}

	//Finding the center of the operator if it is a 'x'
	if (symbol == 'x') {
		if (!found) {
			for (int k = 0; k < num_operators; k++) {
				int line_2 = operators[k]->get_y() - operators[k]->get_size();
				for (int i = operators[k]->get_x() - operators[k]->get_size(); i <= operators[k]->get_x() + operators[k]->get_size(); i++) {
					if (i == x_pos && line_2 == y_pos && !found) {
						if (grid[operators[k]->get_x()][operators[k]->get_y()] == 'x') {
							to_be_moved.set_x(operators[k]->get_x());
							to_be_moved.set_y(operators[k]->get_y());
							found = true;
							to_be_moved.set_size(operators[k]->get_size());
							//cout << "Found your center: " << "x:" << to_be_moved.get_x() + 1 << " y:" << to_be_moved.get_y() + 1 << " size:" << to_be_moved.get_size() << endl;
						}
					}
					line_2++;
				}
			}
		}


		if (!found) {
			for (int k = 0; k < num_operators; k++) {
				int line_2 = operators[k]->get_y() + operators[k]->get_size();
				for (int i = operators[k]->get_x() - operators[k]->get_size(); i <= operators[k]->get_x() + operators[k]->get_size(); i++) {
					if (i == x_pos && line_2 == y_pos && !found) {
						if (grid[operators[k]->get_x()][operators[k]->get_y()] == 'x') {
							to_be_moved.set_x(operators[k]->get_x());
							to_be_moved.set_y(operators[k]->get_y());
							found = true;
							to_be_moved.set_size(operators[k]->get_size());
							//cout << "Found your center: " << "x:" << to_be_moved.get_x() + 1 << " y:" << to_be_moved.get_y() + 1 << " size:" << to_be_moved.get_size() << endl;
						}
					}
					line_2--;
				}
			}
		}
	}
	//Finding the center of the operator if it is a '/'
	if (symbol == '/') {
		for (int k = 0; k < num_operators; k++) {
			int line_2 = operators[k]->get_y() + operators[k]->get_size();
			for (int i = operators[k]->get_x() - operators[k]->get_size(); i <= operators[k]->get_x() + operators[k]->get_size(); i++) {
				if (i == x_pos && line_2 == y_pos && !found) {
					if (grid[operators[k]->get_x()][operators[k]->get_y()] == '/') {
						to_be_moved.set_x(operators[k]->get_x());
						to_be_moved.set_y(operators[k]->get_y());
						found = true;
						to_be_moved.set_size(operators[k]->get_size());
					}
				}
				line_2--;
			}
		}
		//cout << "Found your center: " << "x:" << to_be_moved.get_x() + 1 << " y:" << to_be_moved.get_y() + 1 << " size:" << to_be_moved.get_size() << endl;
	}


	return to_be_moved;
}


void OperatorGrid::print_operators() {
	//Print whole grid if needed
	/*for (int i = 0; i < grid_rows; ++i) {
		for (int j = 0; j < grid_cols; ++j)
		{
			cout << grid[i][j];
			cout << "  ";
		}
		cout << endl;
	}
	*/
	for (int i = 0; i < num_operators; i++) {
		operators[i]->print_operator();
	}
}

//Destructor
OperatorGrid::~OperatorGrid() {
	//Freeing all the places taken
	for (int i = 0; i < grid_rows; i++) {
		delete grid[i];
	}
	delete grid;
	//Delete operators;
	for (int i = 0; i < num_operators; i++) {
		delete operators[i];
	}


	cout << "DESTRUCTOR: GIVE BACK[" << grid_rows << "," << grid_cols << "] chars." << endl;
	cout << "DESTRUCTOR : GIVE BACK[" << num_operators << "] Operators." << endl;
}

//Control Border or Conflict Function
int OperatorGrid::ctrl_border(int x_pos, int y_pos, int size, char symbol) {
	int x = grid_rows - 1;
	int y = grid_cols - 1;
	if (symbol == '+') {
		int up = x_pos - size;
		int right = y_pos + size;
		int left = y_pos - size;
		int down = x_pos + size;
		bool border_flag = false;
		bool conflict_flag = false;

		if (up < 0 || right < 0 || left < 0 || down < 0 ||
			up > x || right > y || left > y || down > x ||
			x_pos < 0 || x_pos > x || y_pos < 0 || y_pos > y) {
			border_flag = true;
		}

		for (int i = x_pos - size; i <= x_pos + size; i++) {
			if (i >= 0 && i <= x && i <= y && grid[i][y_pos] != '0') conflict_flag = true;
		}

		for (int j = y_pos - size; j <= y_pos + size; j++) {
			if (j >= 0 && j <= x && j <= y && grid[x_pos][j] != '0') conflict_flag = true;
		}
		//Returns 4 different values for all different cases
		if (!border_flag && !conflict_flag) return 1;
		if (border_flag && !conflict_flag) return 2;
		if (!border_flag && conflict_flag) return 3;
		if (border_flag && conflict_flag) return 4;

		return 0;
	}

	if (symbol == '-') {
		int right = y_pos + size;
		int left = y_pos - size;
		bool border_flag = false;
		bool conflict_flag = false;

		if (right<0 || right > y || left < 0 || left > y || x_pos < 0 || x_pos > x || y_pos < 0 || y_pos > y) border_flag = true;

		for (int i = y_pos - size; i <= y_pos + size; i++) {
			if (i >= 0 && i <= x && i <= y && grid[x_pos][i] != '0') conflict_flag = true;
		}

		if (!border_flag && !conflict_flag) return 1;
		if (border_flag && !conflict_flag) return 2;
		if (!border_flag && conflict_flag) return 3;
		if (border_flag && conflict_flag) return 4;

		return 0;
	}

	if (symbol == 'x') {
		int up_right_x = x_pos + size;
		int up_right_y = y_pos + size;
		int up_left_x = x_pos - size;
		int up_left_y = y_pos + size;
		int down_right_x = x_pos + size;
		int down_right_y = y_pos - size;
		int down_left_x = x_pos - size;
		int down_left_y = y_pos - size;

		bool border_flag = false;
		bool conflict_flag = false;

		if (up_right_x < 0 || up_right_x > x || up_right_y < 0 || up_right_y > y ||
			up_left_x < 0 || up_left_x > x || up_left_y < 0 || up_left_y > y ||
			down_right_x < 0 || down_right_x > x || down_right_y < 0 || down_right_y > y ||
			down_left_x < 0 || down_left_x > x || down_left_y < 0 || down_left_y > y) border_flag = true;

		int line_2 = y_pos - size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			if (i >= 0 && i <= x && i <= y && line_2 >= 0 && line_2 <= x && line_2 <= y && grid[i][line_2] != '0') conflict_flag = true;
			line_2++;
		}


		line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			if (i >= 0 && i <= x && i <= y && line_2 >= 0 && line_2 <= x && line_2 <= y && grid[i][line_2] != '0') conflict_flag = true;
			line_2--;
		}


		if (!border_flag && !conflict_flag)	return 1;
		if (border_flag && !conflict_flag) return 2;
		if (!border_flag && conflict_flag) return 3;
		if (border_flag && conflict_flag) return 4;

		return 0;
	}

	if (symbol == '/') {
		int up_right_x = x_pos + size;
		int up_right_y = y_pos + size;
		int down_left_x = x_pos - size;
		int down_left_y = y_pos - size;

		bool border_flag = false;
		bool conflict_flag = false;

		if (up_right_x < 0 || up_right_x > x || up_right_y < 0 || up_right_y > y ||
			down_left_x < 0 || down_left_x > x || down_left_y < 0 || down_left_y > y) border_flag = true;

		int line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			if (i >= 0 && i <= x && i <= y && line_2 >= 0 && line_2 <= x && line_2 <= y && grid[i][line_2] != '0') conflict_flag = true;
			line_2--;
		}


		if (!border_flag && !conflict_flag) return 1;
		if (border_flag && !conflict_flag) return 2;
		if (!border_flag && conflict_flag) return 3;
		if (border_flag && conflict_flag) return 4;

		return 0;
	}

}

//Function to place operators to the grid
void OperatorGrid::put_grid(int x_pos, int y_pos, int size, char symbol) {
	grid[x_pos][y_pos] = symbol;
	if (symbol == '+') {
		for (int i = x_pos - size; i <= x_pos + size; i++) grid[i][y_pos] = '+';
		for (int j = y_pos - size; j <= y_pos + size; j++) grid[x_pos][j] = '+';
	}

	if (symbol == '-') {
		for (int i = y_pos - size; i <= y_pos + size; i++) grid[x_pos][i] = '-';
	}

	if (symbol == 'x') {
		int line_2 = y_pos - size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = 'x';
			line_2++;
		}

		line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = 'x';
			line_2--;
		}
	}

	if (symbol == '/') {
		int line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = '/';
			line_2--;
		}
	}
}

//Function to erase the old place of an operator if it is moved
void OperatorGrid::put_zero(int x_pos, int y_pos, int size, char symbol) {
	if (symbol == '+') {
		for (int i = x_pos - size; i <= x_pos + size; i++) grid[i][y_pos] = '0';
		for (int j = y_pos - size; j <= y_pos + size; j++) grid[x_pos][j] = '0';
	}

	if (symbol == '-') {
		for (int i = y_pos - size; i <= y_pos + size; i++) grid[x_pos][i] = '0';
	}

	if (symbol == 'x') {
		int line_2 = y_pos - size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = '0';
			line_2++;
		}

		line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = '0';
			line_2--;
		}
	}

	if (symbol == '/') {
		int line_2 = y_pos + size;
		for (int i = x_pos - size; i <= x_pos + size; i++) {
			grid[i][line_2] = '0';
			line_2--;
		}
	}
}