#ifndef OCCUR_NODE_H
#define OCCUR_NODE_H


struct occur_node {
	char character;
	occur_node *next;
	int occurence;
};

#endif