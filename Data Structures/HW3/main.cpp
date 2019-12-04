#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>

#define MAX_COUNT 1000
#define CARD_MIN -1000000
#define CARD_MAX 1000000

using namespace std;

struct Node {
	int data;
	Node *next;
};

//General Stack Initialization
struct Stack {
	Node *top;
	void create();
	void close();
	void push(int);
	int pop();
	bool isempty();
};

void Stack::create() {
	top = NULL;
}

void Stack::close() {
	Node *p;
	while (top) {
		p = top;
		top = top->next;
		delete p;
	}
}

void Stack::push(int data) {
	Node *newnode = new Node;
	newnode->data = data;
	newnode->next = top;
	top = newnode;
}

int Stack::pop() {
	//This function returns integer, so to control if the popped item is the last one or not, it returns CARD__MAX + 1 if the stack is empty
	if (top == NULL) return CARD_MAX+1;
	Node *tobedeleted = top;
	int data = top->data;
	top = top->next;
	delete tobedeleted;
	return data;
}

bool Stack::isempty() {
	return top == NULL;
}




int main(int argc, char** argv) {
	argc = argc;
	Stack A;
	Stack B;
	Stack Table;
	Stack Bin;

	A.create();
	B.create();
	Table.create();
	Bin.create();
	int tableDeckCount = 0;
	int playerDeckCount = 0;

	//Opening the file
	ifstream in;
	in.open(argv[1]);

	in >> tableDeckCount;
	//cout << tableDeckCount;

	in >> playerDeckCount;
	//cout << playerDeckCount;

	//Controlling the border values for tableDeckCount and playerDeckCount
	if (tableDeckCount < 0 || tableDeckCount > MAX_COUNT || playerDeckCount < 0 || playerDeckCount > MAX_COUNT) {
		cout << "Error in input file!" << endl;
		return 0;
	}

	int data = 0;

	//Pushing the cards of table deck to Table stack
	for (int i = 0; i < tableDeckCount; i++) {
		in >> data;
		if (data < CARD_MIN || data > CARD_MAX) {
			cout << "Error in input file!" << endl;
			return 0;
		}
		Table.push(data);
	}

	//Pushing the cards of the first player to A stack
	for (int i = 0; i < playerDeckCount; i++) {
		in >> data;
		if (data < CARD_MIN || data > CARD_MAX) {
			cout << "Error in input file!" << endl;
			return 0;
		}
		A.push(data);
	}

	//Pushing the cards of the second player to B stack
	for (int i = 0; i < playerDeckCount; i++) {
		in >> data;
		if (data < CARD_MIN || data > CARD_MAX) {
			cout << "Error in input file!" << endl;
			return 0;
		}
		B.push(data);
	}
	//Change the order of the players
	bool first_turn = true;

	//Control if the table is empty or if any player's cards are finished
	while (!Table.isempty() && !A.isempty() && !B.isempty()) {
		int fromDeck = Table.pop();
		int fromA, fromB;

		//Control if the stack is empty
		if (fromDeck > CARD_MAX) break;
		//Find the absolute value of fromDeck in order to construct the for loops properly
		int absDeck = fromDeck;
		if (absDeck < 0) absDeck *= -1;

		//Repeat up to the number of the card from the deck 
		for (int i = 0; i < absDeck; i++) {
			//Player 1 plays
			if (first_turn) {
				//If card number from the table deck is negative, first player should give the cards
				if (fromDeck < 0) {
					fromA = A.pop();
					fromB = B.pop();
					//Control if the stacks are empty
					if (fromA > CARD_MAX || fromB > CARD_MAX) break;
					//If the card from A is bigger, push it to B stack
					if (fromA > fromB) {
						//Second one's popped card goes back
						B.push(fromB);
						B.push(fromA);
					}
					//If the card is not bigger, push it to the bin
					else {
						B.push(fromB);
						Bin.push(fromA);
					}
				}
				//If the card number from the table deck is positive, first player should take cards
				else {
					fromA = A.pop();
					fromB = B.pop();
					//Control if the stacks are empty
					if (fromA > CARD_MAX || fromB > CARD_MAX) break;
					//If the card from the first one is smaller, he takes
					if (fromA < fromB) {
						A.push(fromA);
						A.push(fromB);
					}
					//If not, it goes to the bin, first one's card goes back to his stack
					else {
						A.push(fromA);
						Bin.push(fromB);
					}
				}
			}
			else {
				//Second Player's turn and same steps
				if (fromDeck < 0) {
					fromA = A.pop();
					fromB = B.pop();
					if (fromA > CARD_MAX || fromB > CARD_MAX) break;
					if (fromB > fromA) {
						A.push(fromA);
						A.push(fromB);
					}
					else {
						A.push(fromA);
						Bin.push(fromB);
					}
				}

				else {
					fromA = A.pop();
					fromB = B.pop();
					if (fromA > CARD_MAX || fromB > CARD_MAX) break;
					if (fromB < fromA) {
						B.push(fromB);
						B.push(fromA);
					}
					else {
						B.push(fromB);
						Bin.push(fromA);
					}
				}
			}
		}
		//Change the order of the players
		first_turn = !first_turn;
	}

	int bin_counter = 0;
	int bin_data = 0;

	//Count the elements in the bin
	while (!Bin.isempty()) {
		bin_data = Bin.pop();
		//Control if the stack is empty
		if (bin_data > MAX_COUNT) break;
		bin_counter++;
	}
	cout << bin_counter;

	//Delete all the stacks
	A.close();
	B.close();
	Table.close();
	Bin.close();
	//getchar();
}
