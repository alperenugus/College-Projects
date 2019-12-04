#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include "language_model.h"
#include "occur_node.h"
#include "vocab_list.h"
#include "vocab_node.h"
#include <locale.h>
#include <string.h>


using namespace std;

int main(int argc, char **argv){
	language_model lm;
	lm.vocabularylist = new vocab_list;
	
	char *filename = argv[1];

	lm.readData(filename, lm.vocabularylist);
	if (argc > 2) {
		char *first_p = argv[2];
		char *second_p = argv[3];
		char first = first_p[0];
		char second = second_p[0];
		if (strcmp(first_p, "<SP>") == 0) first = ' ';
		if (strcmp(second_p, "<SP>") == 0) second = ' ';

		cout << lm.calculateProbability(lm.vocabularylist, first, second) << endl;
	}

	else lm.vocabularylist->print();
}
