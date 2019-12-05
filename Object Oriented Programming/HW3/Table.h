#pragma once
#include <queue>
#include "Order.h"

class Table {
private:
	string name;
	queue <Order> orders;
public:
	void addOrder(Order);
	void rmvOrder();
	void setName(string);
	string getName();
	queue <Order> getOrders();
};

void Table::setName(string name) {
	this->name = name;
}

string Table::getName() {
	return name;
}

void Table::addOrder(Order order) {
	orders.push(order);
}

queue <Order> Table::getOrders() {
	return this->orders;
}

void Table::rmvOrder() {
	orders.pop();
}
