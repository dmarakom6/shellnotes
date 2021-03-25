/*
shellnotes - disfailed.cpp
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
  	std::ofstream outfile ("../../logs/disfailed.txt", std::ios_base::app);
  	outfile << "DISABLING FAILED IN " << dt << "\n";
  	outfile.close();
	return 0;
}