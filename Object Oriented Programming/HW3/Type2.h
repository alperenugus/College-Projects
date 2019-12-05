#pragma once
#include "Ingredients.h"
#include <iostream>

using namespace std;
class Type2 :public Ingredients {

public:
	Type2(string name, int amount, float price, int type) : Ingredients(name, amount, price, 0) {};
	float calc_price();
};

float Type2::calc_price() {
	return amount * price;
}