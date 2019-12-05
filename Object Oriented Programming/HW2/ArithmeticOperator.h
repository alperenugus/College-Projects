#pragma once
#include "Operator.h"
#include <iostream>

using namespace std;

class ArithmeticOperator : public Operator {
	char sign;

public:
	ArithmeticOperator(int x, int y, int size, char sign);
	char get_sign();
	void set_sign(char);
	void print_operator();
};

ArithmeticOperator::ArithmeticOperator(int x, int y, int size, char sign) : Operator(x - 1, y - 1, size) {
	if (sign != '+' && sign != '-' && sign != '/' && sign != 'x' && sign != '?') {
		cout << "SIGN parameter is invalid!" << endl;
		return;
	}
	this->sign = sign;
}

void ArithmeticOperator::print_operator() {
	cout << "ARITHMETIC_OPERATOR[" << sign << "], CENTER_LOCATION[" << get_x() + 1 << ", " << get_y() + 1 << "], SIZE[" << get_size() << "]" << endl;
}

//GETTER METHOD
char ArithmeticOperator::get_sign() {
	return sign;
}
//SETTER METHOD
void ArithmeticOperator::set_sign(char c) {
	sign = c;
}
