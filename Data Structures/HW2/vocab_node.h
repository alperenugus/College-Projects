#ifndef VOCAB_NODE_H
#define VOCAB_NODE_H
#include "occur_node.h"


struct vocab_node {
	char character;
	vocab_node *next;
	occur_node *list;

};

#endif