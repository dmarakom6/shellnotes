/*
shellnotes - sdfailed.cpp
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
	ofstream sdfailed;
  	std::ofstream outfile ("../../logs/sdfailed.txt", std::ios_base::app);
  	outfile << "INVALID PATH FOR DEFAULT EDITOR/FOLDER IN " << dt << "\n";
  	outfile.close();
	return 0;
}