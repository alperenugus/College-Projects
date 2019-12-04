#include <iostream>
#include <stdlib.h>
#include <stdio.h>

using namespace std;

struct operation {
	int founded[2];
	int size;
};

int ctrl_border(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size);
int ctrl_plus(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size);
int ctrl_minus(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size);
int ctrl_multi(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size);
int ctrl_div(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size);
void put_plus(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_plus_zero(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_minus(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_minus_zero(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_multi(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_multi_zero(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_div(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_div_zero(char **grid, char symbol, int x_pos, int y_pos, int size);
void put_grid(char **grid, char symbol, int x_pos, int y_pos, int size);
operation find_center(char **grid, int x, int y, int **centers_array, int *sizes_array, char symbol, int x_pos, int y_pos);



int main(int argc, char **argv)
{

	//FILE *g = fopen(argv[1], "r");
	FILE *g = fopen("grid.txt", "r");
	int x = 0;
	int y = 0;

	//Getting the size of the grid
	fseek(g, 0, SEEK_SET);
	fscanf(g, "%d %d", &x, &y);

	//Initilazing 2 dimensional dynamic char array
	char **grid = new char *[x];

	for (int i = 0; i < x; i++) {
		grid[i] = new char[y];
	}
	//Assigning all the elements in the grid to 0
	for (int i = 0; i < x; ++i) {
		for (int j = 0; j < y; ++j)
		{
			grid[i][j] = '0';
			//cout << grid[i][j];
			//cout << "  ";
		}
		//cout << endl;
	}
	//cout << endl;
	cout << "A grid is created: " << x << " " << y << endl;

	int max_centers = (x * y) / 3 + 1;
	//cout << max_centers << endl;
	//int centers_array[27][2];

	int **centers_array = new int *[max_centers];
	for (int i = 0; i < max_centers; i++) {
		centers_array[i] = new int[2];
	}

	//int sizes_array[max_centers];
	int *sizes_array = new int[max_centers];

	for (int i = 0; i < max_centers; i++) {
		for (int j = 0; j < 2; j++) {
			centers_array[i][j] = -1;
		}
	}

	int succeeded = 0;
	//Traversing all the data in the grid.txt file
	while (!feof(g)) {
		char symbol;
		int x_pos;
		int y_pos;
		int size;
		//EOF Flag to prevent taking the last line as input for twice
		char eof_flag;
		eof_flag = fscanf(g, "%s %d %d %d", &symbol, &x_pos, &y_pos, &size);
		if (eof_flag == EOF) break;
		x_pos--;
		y_pos--;
		int ctrl;
		//Controlling if there is a border or conflict error
		ctrl = ctrl_border(grid, x, y, symbol, x_pos, y_pos, size);
		if (ctrl == 1) {
			// SUCCESS
			cout << "SUCCESS: Operator " << symbol << " with size " << size << " is placed on (" << x_pos + 1 << "," << y_pos + 1 << ")." << endl;

			centers_array[succeeded][0] = x_pos;
			centers_array[succeeded][1] = y_pos;
			sizes_array[succeeded] = size;
			succeeded++;
			// FUNCTION TO PUT THE DATA INTO THE GRID
			put_grid(grid, symbol, x_pos, y_pos, size);
		}
		if (ctrl == 2) {
			// BORDER ERROR
			cout << "BORDER ERROR: Operator " << symbol << " with size " << size << " can not be placed on (" << x_pos + 1 << "," << y_pos + 1 << ")." << endl;
		}
		if (ctrl == 3) {
			// CONFLICT ERROR
			cout << "CONFLICT ERROR: Operator " << symbol << " with size " << size << " can not be placed on (" << x_pos + 1 << "," << y_pos + 1 << ")." << endl;
		}
		if (ctrl == 4) {
			// BOTH BORDER AND CONFLICT ERROR
			cout << "BORDER ERROR: Operator " << symbol << " with size " << size << " can not be placed on (" << x_pos + 1 << "," << y_pos + 1 << ")." << endl;
			cout << "CONFLICT ERROR: Operator " << symbol << " with size " << size << " can not be placed on (" << x_pos + 1 << "," << y_pos + 1 << ")." << endl;
		}

	}

	//Closing grid.txt file
	fclose(g);

	//FILE *inst = fopen(argv[2], "r");
	FILE *inst = fopen("instructions.txt", "r");

	while (!feof(inst)) {
		char *command = new char[3];
		int inst_x_pos;
		int inst_y_pos;
		int distance;
		char symbol = '0';
		int new_control;
		char new_eof_flag;

		//GET THE INSTRUCTIONS FROM THE FILE
		new_eof_flag = fscanf(inst, "%s %d %d %d", command, &inst_x_pos, &inst_y_pos, &distance);
		if (new_eof_flag == EOF) break;
		inst_x_pos--;
		inst_y_pos--;
		symbol = grid[inst_x_pos][inst_y_pos];

		if (symbol != '0') {

			//FIND THE CENTER POINT
			operation will_be_moved = find_center(grid, x, y, centers_array, sizes_array, symbol, inst_x_pos, inst_y_pos);

			//MAKE THOSE POINTS ZERO FOR THE CONTROL OF THE NEXT PLACE (TO MAKE THEM NOT TO CONFLICT WITH THEMSELVES)
			if (symbol == '+') put_plus_zero(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			if (symbol == '-') put_minus_zero(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			if (symbol == 'x') put_multi_zero(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			if (symbol == '/') put_div_zero(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);

			int next_x_pos = will_be_moved.founded[0];
			int next_y_pos = will_be_moved.founded[1];

			//DEFINE NEW CENTER POINTS ACCORDING TO INSTRUCTIONS
			if (command[2] == 'U')  next_x_pos -= distance;

			if (command[2] == 'D')  next_x_pos += distance;

			if (command[2] == 'R')  next_y_pos += distance;

			if (command[2] == 'L')  next_y_pos -= distance;

			//cout <<	"***" << next_x_pos << next_y_pos << endl;

			new_control = ctrl_border(grid, x, y, symbol, next_x_pos, next_y_pos, will_be_moved.size);
			//cout << "Hey:" << new_control << endl;

			if (new_control == 1) {
				cout << "SUCCESS: " << symbol << " moved from (" << will_be_moved.founded[0] + 1 << "," << will_be_moved.founded[1] + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
				int changed_center;
				for (int i = 0; i < max_centers; i++) {
					if (centers_array[i][0] == will_be_moved.founded[0] && centers_array[i][1] == will_be_moved.founded[1]) {
						changed_center = i;
					}
				}

				//Correcting the changed centers
				centers_array[changed_center][0] = next_x_pos;
				centers_array[changed_center][1] = next_y_pos;

				//Change the grid itself according to new positions
				put_grid(grid, symbol, next_x_pos, next_y_pos, will_be_moved.size);
			}
			if (new_control == 2) {
				// BORDER ERROR
				cout << "BORDER ERROR: " << symbol << " can not be moved from (" << will_be_moved.founded[0] + 1 << "," << will_be_moved.founded[1] + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
				put_grid(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			}
			if (new_control == 3) {
				// CONFLICT ERROR
				cout << "CONFLICT ERROR: " << symbol << " can not be moved from (" << will_be_moved.founded[0] + 1 << "," << will_be_moved.founded[1] + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
				put_grid(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			}
			if (new_control == 4) {
				// BOTH BORDER AND CONFLICT ERROR
				cout << "BORDER ERROR: " << symbol << " can not be moved from (" << will_be_moved.founded[0] + 1 << "," << will_be_moved.founded[1] + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
				cout << "CONFLICT ERROR: " << symbol << " can not be moved from (" << will_be_moved.founded[0] + 1 << "," << will_be_moved.founded[1] + 1 << ") to (" << next_x_pos + 1 << "," << next_y_pos + 1 << ")." << endl;
				put_grid(grid, symbol, will_be_moved.founded[0], will_be_moved.founded[1], will_be_moved.size);
			}
		}
	}

	/*for (int i = 0; i < x; ++i) {
		for (int j = 0; j < y; ++j)
		{
			cout << grid[i][j];
			cout << "  ";
		}
		cout << endl;
	}*/

	//Close the instructions.txt file
	fclose(inst);

	//Freeing all the places taken
	for (int i = 0; i < x; ++i) {
		delete grid[i];
	}
	delete grid;

	for (int i = 0; i < max_centers; i++) {
		delete centers_array[i];
	}

	delete centers_array;
	delete sizes_array;

	getchar();
	return 0;
}


int ctrl_border(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size) {
	//cout << "ctrl_border" << endl;
	switch (symbol)
	{
	case '+':
		return ctrl_plus(grid, x, y, symbol, x_pos, y_pos, size);
		break;

	case '-':
		return ctrl_minus(grid, x, y, symbol, x_pos, y_pos, size);
		break;

	case 'x':
		return ctrl_multi(grid, x, y, symbol, x_pos, y_pos, size);
		break;

	case '/':
		return ctrl_div(grid, x, y, symbol, x_pos, y_pos, size);
		break;

	default:
		return 0;
		break;
	}

}

int ctrl_plus(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size) {
	//cout << "ctrl_plus" << endl;
	x--;
	y--;
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

	if (!border_flag && !conflict_flag) return 1;
	if (border_flag && !conflict_flag) return 2;
	if (!border_flag && conflict_flag) return 3;
	if (border_flag && conflict_flag) return 4;

	return 0;
}

int ctrl_minus(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size) {
	//cout << "ctrl_minus" << endl;
	x--;
	y--;
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

int ctrl_multi(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size) {
	//cout << "ctrl_multi" << endl;
	x--;
	y--;
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

int ctrl_div(char **grid, int x, int y, char symbol, int x_pos, int y_pos, int size) {
	//cout << "ctrl_div" << endl;
	x--;
	y--;
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

void put_grid(char **grid, char symbol, int x_pos, int y_pos, int size) {

	grid[x_pos][y_pos] = symbol;

	switch (symbol)
	{
	case '+':
		return put_plus(grid, symbol, x_pos, y_pos, size);
		break;

	case '-':
		return put_minus(grid, symbol, x_pos, y_pos, size);
		break;

	case 'x':
		return put_multi(grid, symbol, x_pos, y_pos, size);
		break;

	case '/':
		return put_div(grid, symbol, x_pos, y_pos, size);
		break;

	default:
		break;
	}
}

void put_plus(char **grid, char symbol, int x_pos, int y_pos, int size) {
	for (int i = x_pos - size; i <= x_pos + size; i++) grid[i][y_pos] = '+';
	for (int j = y_pos - size; j <= y_pos + size; j++) grid[x_pos][j] = '+';
}

void put_plus_zero(char **grid, char symbol, int x_pos, int y_pos, int size) {
	for (int i = x_pos - size; i <= x_pos + size; i++) grid[i][y_pos] = '0';
	for (int j = y_pos - size; j <= y_pos + size; j++) grid[x_pos][j] = '0';
}

void put_minus(char **grid, char symbol, int x_pos, int y_pos, int size) {
	for (int i = y_pos - size; i <= y_pos + size; i++) grid[x_pos][i] = '-';
}

void put_minus_zero(char **grid, char symbol, int x_pos, int y_pos, int size) {
	for (int i = y_pos - size; i <= y_pos + size; i++) grid[x_pos][i] = '0';
}

void put_multi(char **grid, char symbol, int x_pos, int y_pos, int size) {
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

void put_multi_zero(char **grid, char symbol, int x_pos, int y_pos, int size) {
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

void put_div(char **grid, char symbol, int x_pos, int y_pos, int size) {
	int line_2 = y_pos + size;
	for (int i = x_pos - size; i <= x_pos + size; i++) {
		grid[i][line_2] = '/';
		line_2--;
	}
}

void put_div_zero(char **grid, char symbol, int x_pos, int y_pos, int size) {
	int line_2 = y_pos + size;
	for (int i = x_pos - size; i <= x_pos + size; i++) {
		grid[i][line_2] = '0';
		line_2--;
	}
}

operation find_center(char **grid, int x, int y, int **centers_array, int *sizes_array, char symbol, int x_pos, int y_pos) {
	x--;
	y--;
	bool x_flag = false;
	bool y_flag = false;
	bool found = false;

	int max_centers = (x * y) / 3 + 1;

	operation to_be_moved;
	to_be_moved.founded[0] = 0;
	to_be_moved.founded[1] = 0;
	to_be_moved.size = 0;

	if (symbol == '+') {

		for (int k = 0; k < max_centers; k++) {
			if (centers_array[k][0] != -1) {
				for (int i = centers_array[k][0] - sizes_array[k]; i <= centers_array[k][0] + sizes_array[k]; i++) {
					if (i == x_pos && !found) {
						x_flag = true;
						to_be_moved.founded[0] = centers_array[k][0];
					}
					if (x_flag) {
						for (int j = centers_array[k][1] - sizes_array[k]; j <= centers_array[k][1] + sizes_array[k]; j++) {
							if (j == y_pos) y_flag = true;
							if (x_flag && y_flag && !found) {
								if (grid[centers_array[k][0]][centers_array[k][1]] == '+') {
									to_be_moved.founded[1] = centers_array[k][1];
									found = true;
									to_be_moved.size = sizes_array[k];
								}
							}
						}
					}
				}
			}

		}
		//cout << "Found your center: " << "x:" << to_be_moved.founded[0] + 1 << " y:" << to_be_moved.founded[1] + 1 << " size:" << to_be_moved.size << endl;
		return to_be_moved;
	}


	if (symbol == '-') {
		to_be_moved.founded[0] = x_pos;
		for (int k = 0; k < max_centers; k++) {
			if (centers_array[k][1] != -1) {
				for (int i = centers_array[k][1] - sizes_array[k]; i <= centers_array[k][1] + sizes_array[k]; i++) {
					if (i == y_pos && centers_array[k][0] == x_pos && !found) {
						if (grid[centers_array[k][0]][centers_array[k][1]] == '-') {
							to_be_moved.founded[1] = centers_array[k][1];
							found = true;
							to_be_moved.size = sizes_array[k];
						}
					}
				}
			}
		}
		//cout << "Found your center: " << "x:" << to_be_moved.founded[0] + 1 << " y:" << to_be_moved.founded[1] + 1 << " size:" << to_be_moved.size << endl;
		return to_be_moved;
	}

	if (symbol == 'x') {
		if (!found) {
			for (int k = 0; k < max_centers; k++) {
				int line_2 = centers_array[k][1] - sizes_array[k];
				if (centers_array[k][0] != -1) {
					for (int i = centers_array[k][0] - sizes_array[k]; i <= centers_array[k][0] + sizes_array[k]; i++) {
						if (i == x_pos && line_2 == y_pos && !found) {
							if (grid[centers_array[k][0]][centers_array[k][1]] == 'x') {
								to_be_moved.founded[0] = centers_array[k][0];
								to_be_moved.founded[1] = centers_array[k][1];
								found = true;
								to_be_moved.size = sizes_array[k];
								//cout << "Found your center: " << "x:" << to_be_moved.founded[0] + 1 << " y:" << to_be_moved.founded[1] + 1 << " size:" << to_be_moved.size << endl;
							}
						}
						line_2++;
					}
				}
			}
		}


		if (!found) {
			for (int k = 0; k < max_centers; k++) {
				int line_2 = centers_array[k][1] + sizes_array[k];
				if (centers_array[k][0] != -1) {
					for (int i = centers_array[k][0] - sizes_array[k]; i <= centers_array[k][0] + sizes_array[k]; i++) {
						if (i == x_pos && line_2 == y_pos && !found) {
							if (grid[centers_array[k][0]][centers_array[k][1]] == 'x') {
								to_be_moved.founded[0] = centers_array[k][0];
								to_be_moved.founded[1] = centers_array[k][1];
								found = true;
								to_be_moved.size = sizes_array[k];
								//cout << "Found your center: " << "x:" << to_be_moved.founded[0] + 1 << " y:" << to_be_moved.founded[1] + 1 << " size:" << to_be_moved.size << endl;
							}
						}
						line_2--;
					}
				}
			}
		}

		return to_be_moved;
	}

	if (symbol == '/') {
		for (int k = 0; k < max_centers; k++) {
			int line_2 = centers_array[k][1] + sizes_array[k];
			if (centers_array[k][0] != -1) {
				for (int i = centers_array[k][0] - sizes_array[k]; i <= centers_array[k][0] + sizes_array[k]; i++) {
					if (i == x_pos && line_2 == y_pos && !found) {
						if (grid[centers_array[k][0]][centers_array[k][1]] == '/') {
							to_be_moved.founded[0] = centers_array[k][0];
							to_be_moved.founded[1] = centers_array[k][1];
							found = true;
							to_be_moved.size = sizes_array[k];
						}
					}
					line_2--;
				}
			}
		}
		//cout << "Found your center: " << "x:" << to_be_moved.founded[0] + 1 << " y:" << to_be_moved.founded[1] + 1 << " size:" << to_be_moved.size << endl;
		return to_be_moved;
	}
	return to_be_moved;
}