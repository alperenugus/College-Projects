/* @Author
* Student Name: ALPEREN UGUS
* Student ID : 150160158
* Date: 07.05.2019 */

#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include "Ingredients.h"
#include "Stock.h"
#include "Type1.h"
#include "Type2.h"
#include "Type3.h"
#include "Menu.h"
#include "Table.h"
#include "Order.h"
#include <stdlib.h>

using namespace std;

int main()
{

	Stock stock;
	fstream in_stock;
	in_stock.open("stock.txt");
	in_stock.ignore(256, '\n');

	//FILL STOCK
	while (!in_stock.eof()) {
		if (in_stock.eof()) break;

		string str;
		vector<std::string> tokens;

		string name;
		int type = 0;
		int item_count = type;
		float price = 0.0;


		getline(in_stock, str);
		istringstream iss(str);
		string token;
		//Split stock.txt lines using delimiter \t
		while (getline(iss, token, '\t')) tokens.push_back(token);
		if (!tokens.empty()) {
			price = strtof((tokens.back()).c_str(), 0);
			tokens.pop_back();
			std::istringstream str_itemcount (tokens.back());
			str_itemcount >> item_count;
			//item_count = stoi(tokens.back());
			tokens.pop_back();
			std::istringstream str_type (tokens.back());
			str_type >> type;
			//type = stoi(tokens.back());
			tokens.pop_back();
			name = tokens.back();
			tokens.pop_back();
			//Add items to stock
			stock.add(Ingredients(name, item_count, price, type));
			//cout << name << "\t" << type << "\t" << item_count << "\t" << price << endl;
		}
	}
	in_stock.close();

	Menu menu;
	fstream in_menu;
	in_menu.open("menu.txt");
	in_menu.ignore(256, '\n');

	//FILL MENU
	while (!in_menu.eof()) {
		if (in_menu.eof()) break;
		Dish dish;

		string str;
		vector<std::string> tokens;

		getline(in_menu, str);
		istringstream iss(str);
		string token;
		//Split menu.txt lines first using delimiter \t
		while (getline(iss, token, '\t')) tokens.push_back(token);
		string in_dish;
		in_dish = tokens.back();
		tokens.pop_back();
		//cout << in_dish << endl;
		string dish_name = tokens.back();
		tokens.pop_back();
		dish.setName(dish_name);
		//cout << dish_name << endl;

		string sub_token;
		istringstream sub_iss(in_dish);

		while (getline(sub_iss, sub_token, ',')) {
			//Delete the space between items
			if (sub_token[0] == ' ') {
				sub_token = std::string(&sub_token[1]);
			}
			//cout << sub_token << endl;
			//TYPE1 DISHES
			if (sub_token.find(" gram ") != std::string::npos) {
				int pos = sub_token.find(" gram ");
				string name = sub_token.substr(pos + 6, sub_token.length());
				istringstream str_weight(sub_token.substr(0, pos));
				int weight;
				str_weight>>weight;
				//int weight = stoi(sub_token.substr(0, pos));
				float price = stock.find_price(name);
				price *= weight;
				//cout << "Name: " << name << " Weight: " << weight << " Price: " << price << endl;
				Ingredients ing(name, weight, price, 0);
				dish.add_Ing(ing);
				dish.setPrice();
			}
			//TYPE3 DISHES
			else if (sub_token.find(" ml ") != std::string::npos) {

				int pos = sub_token.find(" ml ");
				string name = sub_token.substr(pos + 4, sub_token.length());
				istringstream str_milliliter(sub_token.substr(0, pos));
				int milliliter;
				str_milliliter>>milliliter;
				//int milliliter = stoi(sub_token.substr(0, pos));
				float price = stock.find_price(name);
				price *= milliliter;
				//cout << "Name: " << name << " Milliliter: " << milliliter << " Price: " << price << endl;
				Ingredients ing(name, milliliter, price, 0);
				dish.add_Ing(ing);
				dish.setPrice();
			}
			//TYPE2 DISHES WITHOUT INGREDIENTS
			else if (sub_token.find("N/A") != std::string::npos) {
				float price = stock.find_price(dish_name);
				dish.solyPrice(price);
			}
			//TYPE2 DISHES WITH INGREDIENTS
			else {
				int pos = sub_token.find(' ');
				string name = sub_token.substr(pos + 1, sub_token.length());
				istringstream str_number(sub_token.substr(0, pos));
				int number;
				str_number>>number;
				//int number = stoi(sub_token.substr(0, pos));
				float price = stock.find_price(name);
				price *= number;
				//cout << "Name: " << name << " Number: " << number << " Price: " << price << endl;
				Ingredients ing(name, number, price, 0);
				dish.add_Ing(ing);
				dish.setPrice();
			}

		}
		menu.add_dish(dish);


	}

	in_menu.close();

	//cout << menu.getDishes().front().getPrice() << endl;
	fstream in_order;
	in_order.open("order.txt");
	queue <Table> tables;

	//FILL TABLES
	while (!in_order.eof()) {
		if (in_order.eof()) break;

		Table table;
		string table_name;
		getline(in_order, table_name);
		table.setName(table_name);
		string str;
		getline(in_order, str);
		istringstream str_ordercount(str);
		int order_count;
		str_ordercount >> order_count;
		//int order_count = stoi(str);

		for (int i = 0; i < order_count; i++) {
			string line;
			getline(in_order, line);
			//cout << line << endl;
			int pos = line.find(' ');
			istringstream str_amount(line.substr(0, pos));
			int amount;
			str_amount >> amount;
			//int amount = stoi(line.substr(0, pos));
			string name = line.substr(pos + 1, line.length());
			Order order(name, amount);
			table.addOrder(order);
		}
		tables.push(table);
	}

	//RUN FOREST RUN
	while (!tables.empty()) {
		string table_name = tables.front().getName();
		cout << table_name << " ordered:" << endl;
		float total_cost = 0;

		while (!tables.front().getOrders().empty()) {
			string name = tables.front().getOrders().front().getName();
			int amount = tables.front().getOrders().front().getAmount();
			//cout << name << " " << amount << endl;
			bool flag = true;

			for (int i = 0; i < amount; i++) {
				vector<Ingredients> service = menu.getDish(name).getIng();
				if (!service.empty()) {
					for (std::vector<Ingredients>::iterator it = service.begin(); it != service.end(); ++it) {
						string ing_name = it->getName();
						int ing_amount = it->getAmount();
						if (!stock.ctrlStock(ing_name, ing_amount)) flag = false;
					}
				}

				else {
					if (!stock.ctrlStock(name, 1)) flag = false;
				}
				//STOCK ENOUGH
				if (flag) {
					for (std::vector<Ingredients>::iterator it = service.begin(); it != service.end(); ++it) {
						string ing_name = it->getName();
						int ing_amount = it->getAmount();
						stock.decStock(ing_name, ing_amount);
					}
					if (service.empty()) {
						stock.decStock(name, 1);
					}
					float cost = menu.getDish(name).getPrice();
					if (i == amount - 1) {
						cout << amount << " " << name << " cost = " << amount * cost << endl;
						total_cost += amount * cost;
					}

				}
				else {
					if (i == amount - 1) cout << "We don't have enough " << name << endl;
				}


			}
			//cout << flag << endl;

			tables.front().rmvOrder();
		}
		tables.pop();
		float tip = total_cost * 15 / 100;
		float tax = total_cost * 8 / 100;
		total_cost += tip + tax;
		cout << "Tip is " << tip << endl;
		cout << "Total cost: " << total_cost << " TL" << endl;
	}

	in_order.close();

	fstream to_stock;
	to_stock.open("stock.txt", std::ios::out | std::ios::trunc);

	to_stock << "Name\tType\tItemCount\tPrice\n";
	for (std::vector<Ingredients>::iterator it = stock.getIng().begin(); it != stock.getIng().end(); ++it) {
		to_stock << it->getName() << '\t' << it->getType() << '\t' << it->getAmount() << '\t' << it->getPrice() << '\n';
	}

	to_stock.close();





	return 0;
}



