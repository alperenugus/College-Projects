#pragma once

#include "Type1.h"
#include "Type2.h"
#include "Type3.h"
#include <vector> 

class Stock {
private:
	vector <Ingredients> ing;

public:
	void add(Ingredients);
	float find_price(string);
	bool ctrlStock(string, int);
	void decStock(string, int);
	vector <Ingredients>& getIng();
};

void Stock::add(Ingredients obj) {
	ing.push_back(obj);
}

float Stock::find_price(string name) {
	for (std::vector<Ingredients>::iterator it = ing.begin(); it != ing.end(); ++it) {
		if (name == it->getName()) return it->getPrice();
	}
	return -1;
}

bool Stock::ctrlStock(string name, int amount) {
	for (std::vector<Ingredients>::iterator it = ing.begin(); it != ing.end(); ++it) {
		if (name == it->getName()) {
			if (it->getAmount() >= amount) return true;
		}
	}
	return false;
}

void Stock::decStock(string name, int amount) {
	for (std::vector<Ingredients>::iterator it = ing.begin(); it != ing.end(); ++it) {
		if (name == it->getName()) {
			it->setAmount(it->getAmount() - amount);
		}
	}
}

vector <Ingredients>& Stock::getIng() {
	return ing;
}
