#include "table.h"

int sumOfNodes(node * root){
    if (!root){
        return 0;
    }
    else{
        return (root->data + sumOfNodes(root->left) + sumOfNodes(root->right));
    }
}

void copyLeaf(node * src, node *& dest){
    if (!src){
        dest = NULL;
        return;
    }
    
    if (src->left)
        copyLeaf(src->left, dest);
    
    if (src->right)
        copyLeaf(src->right, dest);
    
    if (!(src->left) && !(src->right)){         //if node is leaf
        if (!dest){                             //if empty make root
            dest = new node;
            dest->data = src->data;
            dest->left = dest->right = NULL;
        }
        else{
            node* newNodePtr = new node;
            newNodePtr->data = src->data;
            dest = placeNode(dest, newNodePtr);
        }
    }
}

node* placeNode(node*& subTreePtr, node* newNodePtr){
    if (!subTreePtr)
        return newNodePtr;
    else if (subTreePtr->data > newNodePtr->data){
        node* tempPtr = placeNode(subTreePtr->left, newNodePtr);
        subTreePtr->left = tempPtr;
    }
    else{
        node* tempPtr = placeNode(subTreePtr->right, newNodePtr);
        subTreePtr->right = tempPtr;
    }
    return subTreePtr;
}