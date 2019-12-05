/*
Alperen ÜGÜŞ
150160158

*/

#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include "Polynomial.h"
#include "Vector.h"
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int main() {

	int poly_num = 0;
	int vect_num = 0;
	ifstream inPoly;
	ifstream inVect;

	//Opening files
	inPoly.open("Polynomial.txt");
	inVect.open("Vector.txt");

	// Numbers of Polynomials and Vectors
	inPoly >> poly_num;
	inVect >> vect_num;

	//Vectors to hold objects
	vector <Polynomial> polyList ;
	vector <Vector> vectList;

	//Vector to hold values of each iteration
	vector<int> values;

	//Loop that takes polynomial parameters and creates objects accordingly
	for (int i = 0; i < poly_num; i++) {
		int degree = 0;
		int in = 0;
		inPoly >> degree;
		

		for (int k = 0; k <= degree; k++) {
			inPoly >> in;
			values.push_back(in);
		}

		polyList.push_back(Polynomial(degree, values));
		values.clear();

	}

	//Loop that takes vector parameters and creates objects accordingly
	for (int i = 0; i < vect_num; i++) {
		int size = 0;
		int in = 0;
		inVect >> size;


		for (int k = 0; k < size; k++) {
			inVect >> in;
			values.push_back(in);
		}

		vectList.push_back(Vector(size, values));
		values.clear();

	}

	cout << "Polynomial and Vector List Program!" << endl;
	cout << "Polynomials and Vectors are read from text files!" << endl << endl;
	cout << "Possible Actions:" << endl;
	cout << "1. Print Polynomial and Vector lists" << endl;
	cout << "2. Do a polynomial operation" << endl;
	cout << "3. Do a vector operation" << endl;
	cout << "4. Help: Print possible actions" << endl;
	cout << "0. Exit the program" << endl << endl;

	int key = 1;
	int op;
	while (key) {
		cout << "Enter an option: ";

		cin >> op;

		if (op == 1) {
			//Print out all the Vectors and Polynomials
			cout << "Vectors:" << endl;
			for (int i = 0; i < vectList.size(); i++) {
				cout << i + 1 << ". (" << vectList[i] << ")" << endl;
			}
			cout << endl;

			cout << "Polynomials:" << endl;
			for (int i = 0; i < polyList.size(); i++) {
				cout << i+1 << ". " << polyList[i];
				cout << endl;
			}
			cout << endl;
		}

		else if (op == 2) {
			//Polynomial Operations
			cout << "Which polynomial operation would you like to do?((+:addition, *:multiplication):" << endl;
			int pol_1; char operation; int pol_2;
			cin >> pol_1; cin >> operation; cin >> pol_2;
			bool op_flag = true;
			if(operation == '+' || operation == '*') op_flag = false;
			//Exception Handling if there is any kind of unexpected input from the user
			while(pol_1 <= 0 || pol_2 <= 0 || pol_1 > polyList.size() || pol_2 > polyList.size() || op_flag){
				cout << "Please enter valid numbers / operation!" << endl;
				cin >> pol_1; cin >> operation; cin >> pol_2;
				if(operation == '+' || operation == '*') op_flag = false;
				else op_flag = true;
			}
			if(operation == '+') cout << "(" <<polyList[pol_1-1] << ") + (" << polyList[pol_2-1] << ") = " << polyList[pol_1-1] + polyList[pol_2-1] << endl << endl;
			if (operation == '*') cout << "(" << polyList[pol_1 - 1] << ") + (" << polyList[pol_2 - 1] << ") = " << polyList[pol_1 - 1] * polyList[pol_2 - 1] << endl << endl;
		}

		else if (op == 3) {
			//Vectorial Operations
			cout << "Which vector operation would you like to do?((+:addition, *:scalar multiplication, .:dot product):" << endl;
			int vect_1; char operation; int vect_2;
			cin >> vect_1; cin >> operation; cin >> vect_2;
			bool op_flag = true;
			if(operation == '+' || operation == '*' || operation == '.') op_flag = false;
			//Exception Handling if there is any kind of unexpected input from the user
			while(vect_1 <= 0 || vect_2 <= 0 || vect_1 > vectList.size() || vect_2 > vectList.size() || op_flag){
				cout << "Please enter valid numbers / operation!" << endl;
				cin >> vect_1; cin >> operation; cin >> vect_2;
				if(operation == '+' || operation == '*' || operation == '.') op_flag = false;
				else op_flag = true;
			}
			if (operation == '+') cout << "(" << vectList[vect_1 - 1] << ") + (" << vectList[vect_2 - 1] << ") = (" << vectList[vect_1 - 1] + vectList[vect_2 - 1] << ")" << endl << endl;
			if (operation == '*') cout << "(" << vectList[vect_1 - 1] << ") * " << vect_2 << " = (" << vectList[vect_1 - 1] * vect_2 << ")" << endl << endl;
			if (operation == '.') cout << "(" << vectList[vect_1 - 1] << ") . (" << vectList[vect_2 - 1] << ") = (" << vectList[vect_1 - 1] * vectList[vect_2 - 1] << ")" << endl << endl;
		}
		
		//EXIT
		else if (op == 0) break;
	}
}

