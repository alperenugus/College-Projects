#pragma once

class Operator {
	int center_x;
	int center_y;
	int op_size;

public:
	Operator(int x, int y, int size);
	void reset(int new_x, int new_y, int new_size);
	void set_x(int new_x);
	int get_x();
	void set_y(int new_y);
	int get_y();
	void set_size(int new_size);
	int get_size();
};

//Constructor
Operator::Operator(int x, int y, int size) {
	center_x = x;
	center_y = y;
	op_size = size;
}

void Operator::reset(int new_x, int new_y, int new_size) {
	center_x = new_x;
	center_y = new_y;
	op_size = new_size;
}

//SETTER METHODS

void Operator::set_x(int new_x) {
	center_x = new_x;
}

void Operator::set_y(int new_y) {
	center_y = new_y;
}

void Operator::set_size(int new_size) {
	op_size = new_size;
}




//GETTER METHODS

int Operator::get_x() {
	return center_x;
}

int Operator::get_y() {
	return center_y;
}

int Operator::get_size() {
	return op_size;
}