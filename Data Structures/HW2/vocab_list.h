#ifndef VOCAB_LIST_H
#define VOCAB_LIST_H
#include "vocab_node.h"


struct vocab_list {
	vocab_node *head;
	void create();
	void print();
	void add_char(char);
	void create_occur_list();
	void add_occurence(char, char);
	int get_occurence(char);
	int get_union_occurence(char, char);

};

#endif