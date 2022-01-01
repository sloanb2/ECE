#include "table.h"

#include <iostream>

using namespace std;

int main()
{
    node * root = NULL;
    build(root);
    display(root);

    sumOfNodes(root);
    node * dest = NULL;
    copyLeaf(root, dest);
    display(dest);
    
    display(root);
    destroy(root);
    return 0;
}
