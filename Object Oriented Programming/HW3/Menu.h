#pragma once
#include "Dish.h"
#include <vector>

class Menu {

private:
	vector <Dish> dishes;

public:
	void add_dish(Dish);
	Dish getDish(string name);
	vector <Dish> getDishes();

};

void Menu::add_dish(Dish dish) {
	dishes.push_back(dish);
}

vector <Dish> Menu::getDishes() {
	return dishes;
}

Dish Menu::getDish(string name) {
	Dish dish;
	for (std::vector<Dish>::iterator it = dishes.begin(); it != dishes.end(); ++it) {
		if (name == it->getName()) return *it;
	}
	return dish;
}