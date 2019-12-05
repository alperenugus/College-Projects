/*
Alperen ÜGÜŞ
150160158

*/

#pragma once

class Vector {

private:
	int size;
	vector<int> values;

public:
	Vector();
	Vector(int, vector <int>);
	~Vector();
	Vector(const Vector &);
	int getSize() const;
	vector<int> getValues() const;
	Vector operator+ (const Vector &) const;
	int operator* (const Vector &) const;
	Vector operator* (int) const;
	friend ostream & operator<< (ostream &output, const Vector &);
};
//Constructor
Vector::Vector(){
	this->size = 0;
	this->values.push_back(0);
}
//Constructor 2
Vector::Vector(int size, vector <int> values) {
	this->size = size;
	this->values = values;
}
//Destructor
Vector::~Vector() {
	values.clear();
}
//Copy constructor
Vector::Vector(const Vector &v) {
	size = v.getSize();
	values = v.getValues();
}
//Getter
int Vector::getSize() const {
	return size;
}
//Getter 2
vector<int> Vector::getValues() const {
	return values;
}
// + operator overloading
Vector Vector::operator+ (const Vector &v) const {
	int new_size = 0;
	vector<int> new_values(new_size, 0);

	if (size != v.getSize()) {
		cout << "Vectors' sizes should be equal!" << endl;
		return Vector(new_size, new_values);
	} 
	
	else {
		new_size = size;
		for (int i = 0; i < size; i++) {
			new_values.push_back(values[i] + v.getValues()[i]);
		}
	}

	return Vector(size, new_values);
}
// * operator overloading
int Vector::operator* (const Vector &v) const {
	int result = 0;
	if (size != v.getSize()) {
		cout << "Vectors' sizes should be equal!" << endl;
		return 0;
	}
	else {
		for (int i = 0; i < size; i++) {
			result += values[i] * v.getValues()[i];
		}
		return result;
	}

}
// * operator overloading with integer parameter
Vector Vector::operator* (int x) const {
	vector<int> new_values(size, 0);
	for (int i = 0; i < size; i++) {
		new_values[i] = values[i] * x;
	}

	return Vector(size, new_values);
}
// << operator overloading
ostream & operator<< (ostream &output, const Vector &v){
	for (int i = 0; i < v.getSize(); i++) {
		output << v.getValues()[i];
		if (i != v.getSize() - 1) output << ",";
		if (v.getSize() != 1 && i != v.getSize() - 1) output << " ";
	}
	return output;
}
