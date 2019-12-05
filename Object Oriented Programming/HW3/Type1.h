#pragma once
#include "Ingredients.h"
#include <iostream>

using namespace std;
class Type1:public Ingredients {

public:
	Type1(string name, int amount, float price, int type) : Ingredients(name, amount, price, type) {};
	float calc_price();
};

float Type1::calc_price() {
	//cout << "Poly" << endl;
	return amount * price;
}
