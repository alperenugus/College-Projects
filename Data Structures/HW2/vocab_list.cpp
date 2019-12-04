#include "vocab_list.h"
#include "language_model.h"
#include <stdlib.h>
#include <iostream>

using namespace std;

void vocab_list::create() {
	head = NULL;
}

void vocab_list::print() {
	vocab_node *traverse = head;
	occur_node *occurtraverse;

	while (traverse) {
		occurtraverse = traverse->list;
		if(traverse->character == ' ') cout << "<SP>" << ":" << endl;
		else cout << traverse->character << ":" << endl;
		while (occurtraverse) {
			cout << '\t';
			if(occurtraverse->character == ' ') cout << "<" << "<SP>" << "," << occurtraverse->occurence << ">" << endl;
			else cout << "<" << occurtraverse->character << "," << occurtraverse->occurence << ">" << endl;
			occurtraverse = occurtraverse->next;
		}
		cout << endl;
		traverse = traverse->next;
	}


}

void vocab_list::add_char(char new_char) {
	vocab_node *traverse, *tail, *newnode;
	newnode = new vocab_node;
	newnode->character = new_char;
	newnode->next = NULL;
	traverse = head;
	tail = NULL;

	//If an exising character or a newline character comes, pass it
	while (traverse)
	{
		if (newnode->character == traverse->character || newnode->character == '\n') {
			return;
		}
		traverse = traverse->next;
	}

	traverse = head;
	tail = NULL;

	//Any char except from letters will be added to the end
	if (!((newnode->character>=65 && newnode->character<=90) || 
		(newnode->character >= 97 && newnode->character <= 122))) {
		while (traverse) {
			tail = traverse;
			traverse = traverse->next;
		}
		tail->next = newnode;
		return;
	}
	
	traverse = head;
	tail = NULL;

	//If the list is empty
	if (head == NULL) {
		head = newnode;
		return;
	}

	//Add to the beginning
	if (newnode->character < head->character) {
		newnode->next = head;
		head = newnode;
		return;
	}

	//Find if it fits to a place in the middle and controls if the traverse character is a punctuation or not
	while (traverse && newnode->character > traverse->character && 
		((traverse->character >= 65 && traverse->character <= 90) ||
		(traverse->character >= 97 && traverse->character <= 122))) {
		tail = traverse;
		traverse = traverse->next;
	}
	//If not in the end, add it to the list
	if (traverse) {
		newnode->next = traverse;
		tail->next = newnode;
	}
	//Add to the end
	else {
		tail->next = newnode;
	}

}

void vocab_list::add_occurence(char first, char second) {
	vocab_node *traverse = head;
	occur_node *newnode, *tail;
	tail = new occur_node;
	newnode = new occur_node;
	newnode->character = second;
	newnode->next = NULL;
	newnode->occurence = 1;
	occur_node *occurtraverse;
	bool occur_flag = false;
	
	//When the text finishes, get function returns -1, to prevent that, I added this if clause
	if (second < 0) return;

	//Detect the main character in the first list
	while (traverse->character != first) {
		traverse = traverse->next;
	}
	
	//If occur list is empty
	if (traverse->list == NULL) {
		traverse->list = newnode;
		return;
	}

	//If not empty, control if the occured char is added or not
	else {
		occurtraverse = traverse->list;
		while (occurtraverse) {
			if (occurtraverse->character == second) {
				//cout << occurtraverse->character << " " << occurtraverse->occurence << endl;
				occurtraverse->occurence++;
				occur_flag = true;
				break;
			}
			occurtraverse = occurtraverse->next;
		}
	}

	//If not empty and the occured character is not added yet
	if (!occur_flag) {
		//Add to the beginning
		/*newnode->next = traverse->list;
		traverse->list = newnode;*/

		//Add to the end
		occurtraverse = traverse->list;
		while (occurtraverse) {
			tail = occurtraverse;
			occurtraverse = occurtraverse->next;
		}
		tail->next = newnode;
	}



}

void vocab_list::create_occur_list() {
	vocab_node *traverse = head;
	while (traverse) {
		traverse->list = NULL;
		traverse = traverse->next;
	}
}

int vocab_list::get_occurence(char letter) {
	int occur_num = 0;
	vocab_node *traverse = head;
	occur_node *occurtraverse;

	//Find the char in the main list
	while (traverse->character != letter) {
		if (traverse->next == NULL) {
			traverse = NULL;
			break;
		}
		traverse = traverse->next;
	}
	//If not found in the list
	if (traverse == NULL) return 0;

	//Add all the co-occurences to find the total count of the letter
	occurtraverse = traverse->list;
	while (occurtraverse) {
		occur_num += occurtraverse->occurence;
		occurtraverse = occurtraverse->next;
	}
	return occur_num;
}

int vocab_list::get_union_occurence(char first, char second) {
	vocab_node *traverse = head;
	occur_node *occurtraverse;
	int union_num = 0;

	//Find the first in the main list
	while (traverse->character != first) {
		traverse = traverse->next;
	}

	//Find the second in the found character's cooccurence list
	occurtraverse = traverse->list;
	while (occurtraverse) {
		if (occurtraverse->character == second) {
			union_num = occurtraverse->occurence;
			break;
		}
		occurtraverse = occurtraverse->next;
	}
	return union_num;
}
