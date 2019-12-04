#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

struct Node {
	int number;
	Node *left;
	Node *right;
};

struct Tree {
	Node *root;
	void create();
	Node* insert(int arr[], Node *root, int i, int arr_size);
	void leftPath(Node *x);
	void rightPath(Node *x);
};

void Tree::create() {
	root = NULL;
}

void inOrder(Node* root)
{
	if (root != NULL)
	{
		inOrder(root->left);
		cout << root->number << " ";
		inOrder(root->right);
	}
}

Node* Tree::insert(int arr[], Node *root, int i, int arr_size) {
	//cout << arr[arr_size] << endl;
	if (i <= arr_size) {
		Node* temp = new Node;
		temp->number = arr[i];
		temp->left = NULL;
		temp->right = NULL;

		//Insertion to tree InOrder
		root = temp;
		root->left = insert(arr, root->left, 2 * i + 1, arr_size);
		root->right = insert(arr, root->right, 2 * i + 2, arr_size);

	}
	return root;
}

//An array to hold all left_paths
int counter_left = 0;
int left_paths[100][100];

void left_search(int ints[], int len)
{
	int i;
	for (i = 0; i < len; i++) {
		//printf("%d ", ints[i]);
		//Add coming array to left_paths array of arrays
		left_paths[counter_left][i] = ints[i];
	}
	//printf("\n");
	counter_left++;
}

//An array to hold all right_paths
int counter_right = 0;
int right_paths[100][100];

void right_search(int ints[], int len)
{
	int i;
	for (i = 0; i < len; i++) {
		//printf("%d ", ints[i]);
		//Add coming array to right_paths array of arrays
		right_paths[counter_right][i] = ints[i];
	}
	//printf("\n");
	counter_right++;
}


//Function to traverse all left paths
void Recur_left(struct Node* root, int path[], int pathLen) {
	if (root == NULL) return;

	//append this node to the path array
	path[pathLen] = root->number;
	pathLen++;

	//it's a leaf
	if (root->left == NULL && root->right == NULL)
	{
		left_search(path, pathLen);
	}
	else
	{
		//otherwise try both subtrees
		Recur_left(root->left, path, pathLen);
		Recur_left(root->right, path, pathLen);
	}
}


//Function to traverse all right paths
void Recur_right(struct Node* root, int path[], int pathLen) {
	if (root == NULL) return;

	//append this node to the path array
	path[pathLen] = root->number;
	pathLen++;

	//it's a leaf
	if (root->left == NULL && root->right == NULL)
	{
		right_search(path, pathLen);
	}
	else
	{
		//otherwise try both subtrees
		Recur_right(root->left, path, pathLen);
		Recur_right(root->right, path, pathLen);
	}
}


void findPaths_left(Node* root)
{
	//Initialize path array to hold path data and call recursive function for left handside
	int path[1000];
	Recur_left(root, path, 0);
}

void findPaths_right(Node* root)
{
	//Initialize path array to hold path data and call recursive function for right handside
	int path[1000];
	Recur_right(root, path, 0);
}


int main(int argc, char ** argv) {
	//Open File
	ifstream in;
	in.open(argv[1]);



	//Create the tree and assign the root
	Tree tree;
	tree.create();

	//An array to hold the numbers to be added to the tree
	int *arr = new int[1];

	int arr_size = 1;
	while (!in.eof()) {
		in >> arr[arr_size - 1];
		arr_size++;
		//A temporary array for expanding the main array with more size (In order to have a dynamically growing array)
		int *tmp = new int[arr_size];
		//Copy contents of the main array
		for (int i = 0; i < arr_size; i++) {
			tmp[i] = arr[i];
		}
		//Delete the array with less size
		delete arr;
		//Get the contents
		arr = tmp;
	}

	//The last element
	//cout << arr[arr_size-3];

	//Sum
	int sum = arr[arr_size - 2];

	//Inserting new elements with Level Order
	tree.root = tree.insert(arr, tree.root, 0, arr_size - 3);

	//inOrder(tree.root);
	//for (int i = 0; i < arr_size-1; i++) cout << arr[i] << endl;

	//Assign -1 to all elements of the two arrays
	for (int i = 0; i < 100; i++) {
		for (int j = 0; j < 100; j++) {
			left_paths[i][j] = -1;
			right_paths[i][j] = -1;
		}
	}


	//Fill the arrays 
	findPaths_left(tree.root->left);
	findPaths_right(tree.root->right);

	int left_true = -1;
	bool left_path_found = false;

	//Traverse all paths and find the indice of the true path for left paths
	for (int i = 0; i < 100; i++) {
		int left_sum = 0;
		left_sum += tree.root->number;
		for (int j = 0; j < 100; j++) {
			if (left_paths[i][j] != -1) {
				left_sum += left_paths[i][j];
				if (left_sum == sum) {
					left_true = i;
					left_path_found = true;
					break;
				}
			}
		}
		if (left_path_found) break;
	}

	int right_true = -1;
	bool right_path_found = false;

	//Traverse all paths and find the indice of the true path for right paths
	for (int i = 0; i < 100; i++) {
		int right_sum = 0;
		right_sum += tree.root->number;
		for (int j = 0; j < 100; j++) {
			if (right_paths[i][j] != -1) {
				right_sum += right_paths[i][j];
				if (right_sum == sum) {
					right_true = i;
					right_path_found = true;
					break;
				}
			}
		}
		if (right_path_found) break;
	}

	//Print the results
	int left_control = tree.root->number;
	if (left_true == -1) cout << "No Path Found" << endl;
	else {
		cout << "Path found: " << tree.root->number << " ";
		for (int i = 0; i < 100; i++) {
			if (left_paths[left_true][i] != -1) {
				cout << left_paths[left_true][i] << " ";
				left_control += left_paths[left_true][i];
				if (left_control == sum) {
					//cout << endl;
					break;
				}
			}
		}
		cout << endl;
	}

	/*for (int i = 0; i < 100; i++) {
		for (int j = 0; j < 100; j++) {
			if (left_paths[i][j] != -1)
				cout << left_paths[i][j] << " ";
		}
		cout << endl;
	}*/

	//Print the results
	int right_control = tree.root->number;
	if (right_true == -1) cout << "No Path Found" << endl;
	else {
		cout << "Path found: " << tree.root->number << " ";
		for (int i = 0; i < 100; i++) {
			if (right_paths[right_true][i] != -1) {
				cout << right_paths[right_true][i] << " ";
				right_control += right_paths[right_true][i];
				if (right_control == sum) {
					//cout << endl;
					break;
				}
			}

		}
		cout << endl;
	}
	//getchar();
}