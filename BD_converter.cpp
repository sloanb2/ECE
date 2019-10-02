/************************************************************
* Author: Bennet Sloan                        Date: 11/1/2017
* Description: Binary-decimal base conversion using recursion
*************************************************************/
#include <iostream>
#include <string>
using std::string;
using std::cout;
using std::cin;
using std::endl;

int binToDec(string str, int pos, int prev)
{
    if (str[pos] == '\0')       //Base case
        return prev;
    
    int val = 0;                //String-integer convert
    if (str[pos] == '1')
        val = 1;
    return binToDec(str, pos + 1, 2 * prev + val);  
}
int binToDec(string str)        //binToDec helper
{
    return binToDec(str, 0, 0);
}

string decToBin(const int num, string binStr)
{
    if (num == 0)               //Base case
        return binStr;
    
    string val = "0";           //Even = 0, Odd = 1
    if (num % 2 != 0)
        val = "1";
    return (decToBin(num / 2, val += binStr));
}
string decToBin(const int num)  //decToBin helper
{
    return decToBin(num, "");
}

int main()
{   string binStr;              //input binary string
    int num;                    //Input integer
    cout << "\nEnter the binary string to convert:\n";
    std::getline (cin, binStr);
    cout << "The integer equivalent is: " << binToDec(binStr) << endl;
    cout << "\nEnter the integer to convert:\n"; 
    cin  >>  num;
    cout << "The binary equivalent is: " << decToBin(num) << "\n\n";
    return 0;}