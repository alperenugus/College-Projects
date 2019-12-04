#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

struct Node {
	int data;
	Node *next;
};

struct queueAnt {
	Node *front;
	Node *back;
	void create();
	void close();
	void enqueue(int);
	int dequeue();
	bool isempty();
	void print();
};

void queueAnt::create() {
	front = NULL; back = NULL;
}
void queueAnt::close() {
	Node *p;
	while (front) {
		p = front;
		front = front->next;
		delete p;
	}
}

void queueAnt::print() {
	Node *tmp = front; //Used a tmp variable not to lose front
	while (tmp) {
		cout << tmp->data << " ";
		tmp = tmp->next;
	}
	cout << endl;
}
void queueAnt::enqueue(int newdata) {
	Node *newnode = new Node;
	newnode->data = newdata;
	newnode->next = NULL;
	if (isempty()) {// first element?
		back = newnode;
		front = back;
	}
	else {//Add to the end
		back->next = newnode;
		back = newnode;
	}
}

int queueAnt::dequeue() {
	Node *topnode;
	int temp;
	topnode = front;
	front = front->next; //Change the first element of the queue
	temp = topnode->data;
	delete topnode; //Delete upmost from the queue
	return temp; //Return the upmost one
}

bool queueAnt::isempty() {
	return front == NULL; //If empty, return true
}

struct stackAnt {
	Node *top;
	void create();
	void close();
	void push(int);
	int pop();
	bool isempty();
};

void stackAnt::create() {
	top = NULL;
}

void stackAnt::close() {
	Node *p;
	while (top) {
		p = top;
		top = top->next;
		delete p;
	}
}

void stackAnt::push(int data) {
	Node *newnode = new Node;
	newnode->data = data;
	newnode->next = top; //Make the newcoming data the uppermost one in the stack
	top = newnode;
}

int stackAnt::pop() {
	//Control this.
	Node *tobedeleted = top;
	int data = top->data;
	top = top->next; //Change the upmost element in the stack
	delete tobedeleted; //Delete the old top element
	return data; //Return the upmost element
}

bool stackAnt::isempty() {
	return top == NULL; //Return true if it is empty
}


struct Ants {
	queueAnt ants;
	queueAnt holeDepths;
	stackAnt hole;
	void ReadFile(char *);
	void ShowContents(bool);
	void CrossRoad();
};

void Ants::ReadFile(char *filename) {

	//Initialization of queues and stack
	ants.create();
	holeDepths.create();
	hole.create();

	//Reading from the file
	ifstream in;
	in.open(filename);
	int ant_num;
	//Getting ant number
	in >> ant_num;

	//Filling Ants Queue up to ant number
	for (int i = 1; i <= ant_num; i++) {
		ants.enqueue(i);
	}

	
	int holeDepth;
	while (in >> holeDepth) {
		//Filling holeDepths queues with the data from the file
		holeDepths.enqueue(holeDepth);
		if (in.eof()) break;
	}


};

void Ants::ShowContents(bool mode) {
	if (mode) {
		ants.print();
	}
	else {
		holeDepths.print();
	}
};

void Ants::CrossRoad() {
	//Continue until the end of holeDepths queue
	while (!holeDepths.isempty()) {
		int depth = holeDepths.dequeue();
		int ant;
		//Deque the ants until the hole is filled with ants
		for (int i = 0; i < depth; i++) {
			ant = ants.dequeue();
			//Keep the ants in the hole in the stack
			hole.push(ant);
		}

		while (!hole.isempty()) {
			//Rescue the ants in the hole
			ants.enqueue(hole.pop());
		}
	}
};

int main(int argc, char ** argv) {
	Ants a;
	a.ReadFile(argv[1]); // store the number of ants and depths of holes
	cout << "The initial Ant sequence is: ";
	a.ShowContents(1); // list ant sequence ( initially : 1, 2, ... , N)
	cout << "The depth of holes are : ";
	a.ShowContents(0); // list depth of holes
	a.CrossRoad();
	cout << "The final Ant sequence is: ";
	a.ShowContents(1);

	//Delete queues and stack
	a.ants.close();
	a.hole.close();
	a.holeDepths.close();
	//getchar();
	return 0;
}
