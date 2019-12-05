#pragma once
#include <string>

using namespace std;

class Ingredients {
protected:
	string name;
	int amount;
	float price;
	int type;
public:
	Ingredients(string name, int amount, float price, int type);
	float virtual calc_price();
	string getName();
	int getAmount();
	float getPrice();
	void setPrice(float);
	void setAmount(int);
	int getType();
	void setType(int);
};

Ingredients::Ingredients(string name, int amount, float price, int type) {
	this->name = name;
	this->amount = amount;
	this->price = price;
	this->type = type;
}

float Ingredients::calc_price() {
	return amount * price;
}

string Ingredients::getName() {
	return name;
}
int Ingredients::getAmount() {
	return amount;
}
float Ingredients::getPrice() {
	return price;
}

void Ingredients::setPrice(float price) {
	this->price = price;
}

void Ingredients::setAmount(int amount) {
	this->amount = amount;
}

int Ingredients::getType() {
	return type;
}

void Ingredients::setType(int type) {
	this->type = type;
}