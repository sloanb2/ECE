#ifndef TABLE_H
#define TABLE_H
//table.h
#include <iostream>
#include <cstring>
#include <cctype>
using namespace std;

struct node
{
    int data;
    node * left;
    node * right;;
};

void build(node * & root);  //supplied
void display(node *  root); //supplied
void destroy(node * & root); //supplied

int sumOfNodes(node * root);
void copyLeaf(node * src, node *& dest);
node* placeNode(node*& subTreePtr, node* newNodePtr);
 
#endif
