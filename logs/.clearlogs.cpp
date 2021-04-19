/*
shellnotes - clearlogs.cpp
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
*/


#include <iostream>
#include <fstream>

using namespace std;

int main ()
{
	std::ofstream ofs;
	ofs.open("../../logs/sdfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("../../logs/ufailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("../../logs/ifailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("../../logs/enfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("../../logs/disfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("../../logs/uninfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
}