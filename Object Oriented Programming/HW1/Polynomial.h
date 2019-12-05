/*
Alperen ÜGÜŞ
150160158

*/

#pragma once
#include <vector>
#include <string.h>
using namespace std;

class Polynomial {

private:
	int degree;
	vector<int> values;
public:
	Polynomial();
	Polynomial(int, vector<int>);
	~Polynomial();
	Polynomial(const Polynomial &);
	int getDegree() const;
	vector<int> getValues() const;
	Polynomial operator+ (const Polynomial &) const;
	Polynomial operator* (const Polynomial &) const;
	friend ostream &operator<< (ostream &output, const Polynomial &);
};

//Constructor
Polynomial::Polynomial(){
	this->degree = 0;
	this->values.push_back(0);
}
//Constructor 2
Polynomial::Polynomial(int degree, vector<int> values) {
	this->degree = degree;
	this->values = values;
}
//Destructor
Polynomial::~Polynomial() {
	values.clear();
}
//Copy Constructor
Polynomial::Polynomial(const Polynomial &p) {
	degree = p.getDegree();
	values = p.getValues();
}
//Getter
int Polynomial::getDegree() const {
	return degree;
}
//Getter 2
vector<int> Polynomial::getValues() const {
	return values;
}

// + operator overloading
Polynomial Polynomial::operator+ (const Polynomial &p) const {
	int new_degree;

	if (degree >= p.getDegree()) {
		new_degree = degree;
	} 
	else {
		new_degree = p.getDegree();
	} 

	vector<int> new_values(new_degree+1, 0);

	int j = 0;
	for (int i = new_degree; i >= new_degree - p.getDegree(); i--) {
		new_values[i] += p.getValues()[p.getDegree()-j];
		j++;
	}
	j = 0;
	for (int i = new_degree; i >= new_degree - degree; i--) {
		new_values[i] += values[degree -j];
		j++;
	}

	return Polynomial(new_degree, new_values);
}

// * operator overloading
Polynomial Polynomial::operator* (const Polynomial &p) const{
	int new_degree = degree + p.getDegree();
	vector<int> new_values(new_degree+1, 0);

	for (int i = 0; i <= degree; i++) {
		for (int j = 0; j <= p.getDegree(); j++) {
			new_values[i + j] += values[i] * p.getValues()[j];
		}
	}
	
	return Polynomial(new_degree, new_values);
}



// << operator overloading
ostream &operator<< (ostream &output, const Polynomial &p){

	for (int i = 0; i <= p.getDegree(); i++) {
		if (p.getValues()[i] != 0) {
			if(p.getValues()[i] != 1 && i != p.getDegree()) output << p.getValues()[i];
			if (i != p.getDegree()) output << "x";
			if(i != p.getDegree() && p.getDegree()-i != 1 ) output << "^" << p.getDegree() - i;
			if (i == p.getDegree() && p.getValues()[i] != 0) output << p.getValues()[i];
			if(i != p.getDegree()) cout << " + ";
		} 
	}
	return output;
}