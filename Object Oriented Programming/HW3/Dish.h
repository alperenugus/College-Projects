#pragma once
#include "Ingredients.h"
#include <string>
#include <vector>

class Dish {
private:
	string name;
	float price;
	vector <Ingredients> ing;
public:
	string getName();
	void setName(string);
	void add_Ing(Ingredients);
	void setPrice();
	void solyPrice(float);
	float getPrice();
	vector <Ingredients> getIng();
};

string Dish::getName() {
	return name;
}

void Dish::setName(string name) {
	this->name = name;
}

void Dish::add_Ing(Ingredients ing) {
	this->ing.push_back(ing);
}

void Dish::setPrice() {
	price = 0;
	if (!ing.empty()) {
		for (std::vector<Ingredients>::iterator it = ing.begin(); it != ing.end(); ++it) {
			price += it->getPrice();
		}
	}
}

void Dish::solyPrice(float price) {
	this->price = price;
}

float Dish::getPrice() {
	return price;
}

vector <Ingredients> Dish::getIng() {
	return ing;
}