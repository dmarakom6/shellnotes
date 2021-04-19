/*
shellnotes - ifailed.cpp
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
*/

#include <iostream>
#include <fstream>
#include <ctime>

using namespace std;

int main()
{	
	time_t now = time(0);
	char* dt = ctime(&now);
  	std::ofstream outfile ("../../logs/ifailed.txt", std::ios_base::app);
  	outfile << "INSTALLATION FAILED IN " << dt << "\n";
  	outfile.close();
	return 0;
}