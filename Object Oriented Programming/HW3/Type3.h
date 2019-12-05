#pragma once
#include "Ingredients.h"
#include <iostream>

using namespace std;
class Type3 :public Ingredients {

public:
	Type3(string name, int amount, float price, int type) : Ingredients(name, amount, price, 0) {};
	float calc_price();
};

float Type3::calc_price() {
	return amount * price;
}