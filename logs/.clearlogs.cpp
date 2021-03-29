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
	ofs.open("sdfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("ufailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("ifailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("enfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("disfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	ofs.open("uninfailed.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
}