#include <fstream>
#include <iostream>
#include "language_model.h"
#include "vocab_list.h"
#include <locale>

using namespace std;

void language_model::readData(char *filename,vocab_list *vocabularylist) {
	vocabularylist->create();


	char ch;
	fstream fin(filename, fstream::in);
	while (fin >> noskipws >> ch) {
		//cout << ch << endl;
		vocabularylist->add_char(tolower(ch));
		
	}
	//To init occurence lists for all elements
	vocabularylist->create_occur_list();
	
	fin.clear();
	fin.seekg(0, std::ios::beg);
	int pos = 0;

	//Starting to read file
	while (!fin.eof()) {
		char first = fin.get();
		if (first == '\n' || first == '\0') first = ' ';
		if (first >= 65 && first <= 90) first = tolower(first);
		if (fin.eof()) break;
		char second = fin.get();
		char second_eof = second;
		while (second == '\n' || second == EOF || second == '\0') second = ' ';
		if (second >= 65 && second <= 90) second = tolower(second);
		vocabularylist->add_occurence(first, second);
		if (second_eof < 0) break;
		pos++;
		fin.seekg(pos, std::ios::beg);
	}

	//vocabularylist->print();
	//cout << vocabularylist->get_occurence('c');
	//cout << vocabularylist->get_union_occurence('n', ' ');

}

double language_model::calculateProbability(vocab_list *vocabularylist, char first, char second) {
	double probability = 0.0;
	
	double solo = (double)vocabularylist->get_occurence(first);
	//If not found in the list return 0 because there is no such probability
	if (solo == 0) return 0;
	double both = (double)vocabularylist->get_union_occurence(first, second);
	probability = both / solo;
	return probability;

}