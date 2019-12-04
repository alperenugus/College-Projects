#ifndef LANGUAGE_MODEL_H
#define LANGUAGE_MODEL_H
#include "vocab_list.h"


struct language_model {
	vocab_list *vocabularylist;
	void readData(char *filename ,vocab_list *vocabularylist);
	double calculateProbability(vocab_list *vocabularylist, char, char);
};


#endif