#pragma once
#include <string>

using namespace std;
class Order {
private:
	int amount;
	string name;
public:
	Order(string name, int amount);
	void setAmount(int);
	void setName(string);
	int getAmount();
	string getName();
};

Order::Order(string name, int amount) {
	this->name = name;
	this->amount = amount;
}

void Order::setAmount(int amount) {
	this->amount = amount;
}

void Order::setName(string name) {
	this->name = name;
}

int Order::getAmount() {
	return amount;
}

string Order::getName() {
	return name;
}